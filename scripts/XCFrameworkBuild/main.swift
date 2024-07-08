import Foundation

do {
    try Build.performCommand(arguments: Array(CommandLine.arguments.dropFirst()))

    try BuildLuaJIT().buildALL()
} catch {
    print(error.localizedDescription)
    exit(1)
}


enum Library: String, CaseIterable {
    case libluajit
    var version: String {
        switch self {
        case .libluajit:
            return "v2.1"
        }
    }

    var url: String {
        switch self {
        case .libluajit:
            return "https://github.com/LuaJIT/LuaJIT.git"
        }
    }
}

private class BuildLuaJIT: BaseBuild {
    init() {
        super.init(library: .libluajit)

        // remove ABI version, xcframework with ABIVER can't build in swift 5.7.*
        let makefile = directoryURL + "Makefile"
        if let data = FileManager.default.contents(atPath: makefile.path), var str = String(data: data, encoding: .utf8) {
            str = str.replacingOccurrences(of: "-$(ABIVER)", with: "")
            try! str.write(toFile: makefile.path, atomically: true, encoding: .utf8)
        }
        let srcmakefile = directoryURL + "src/Makefile"
        if let data = FileManager.default.contents(atPath: srcmakefile.path), var str = String(data: data, encoding: .utf8) {
            str = str.replacingOccurrences(of: "-$(ABIVER)", with: "")
            try! str.write(toFile: srcmakefile.path, atomically: true, encoding: .utf8)
        }
        let pcfile = directoryURL + "etc/luajit.pc"
        if let data = FileManager.default.contents(atPath: pcfile.path), var str = String(data: data, encoding: .utf8) {
            str = str.replacingOccurrences(of: "-${abiver}", with: "")
            try! str.write(toFile: pcfile.path, atomically: true, encoding: .utf8)
        }

    }

    override func build(platform: PlatformType, arch: ArchType) throws {
        // maccatalyst暂时不支持
        if platform == .maccatalyst {
            return
        }
        let buildURL = scratch(platform: platform, arch: arch)
        try? FileManager.default.createDirectory(at: buildURL, withIntermediateDirectories: true, attributes: nil)
        var environ = [String: String]()
        var arguments = [
            "PREFIX=\(thinDir(platform: platform, arch: arch).path)"
        ]

        if platform == .macos {
            environ["MACOSX_DEPLOYMENT_TARGET"] = "10.15"
            arguments += [
                "TARGET_CFLAGS=--target=\(arch.rawValue)-apple-darwin",
                "TARGET_LDFLAGS=--target=\(arch.rawValue)-apple-darwin",
                "HOST_CFLAGS=--target=x86_64-apple-darwin",
                "HOST_LDFLAGS=--target=x86_64-apple-darwin",
            ]
        } else {
            let xcodePath = Utility.shell("xcode-select -p", isOutput: true) ?? "/Applications/Xcode.app/Contents/Developer"
            environ["TARGET_FLAGS"] = "-arch \(arch.rawValue) -isysroot \(platform.isysroot)"
            arguments += [
                "DEFAULT_CC=clang",
                "CROSS=\(xcodePath)/Toolchains/XcodeDefault.xctoolchain/usr/bin/",
                "TARGET_SYS=iOS",
            ]
        }
        
        try Utility.launch(path: "/usr/bin/make", arguments: ["clean"] + arguments, currentDirectoryURL: directoryURL, environment: environ)
        try Utility.launch(path: "/usr/bin/make", arguments: ["-j8"] + arguments, currentDirectoryURL: directoryURL, environment: environ)
        try Utility.launch(path: "/usr/bin/make", arguments: ["-j8", "install"] + arguments, currentDirectoryURL:  directoryURL, environment: environ)
    }

    override func frameworks() throws -> [String] {
        ["libluajit"]
    }

    override func buildALL() throws {
        try super.buildALL()

        // copy headers
        let firstPlatform = getFirstSuccessPlatform()
        let firstArch = architectures(firstPlatform).first!
        let includeSourceDirectory = thinDir(platform: firstPlatform, arch: firstArch) + ["include", "luajit-2.1"]
        let includeDestDirectory = URL.currentDirectory + "../Sources/luajit/include"
        print("Copy ass headers to path: \(includeDestDirectory.path)")
        try? FileManager.default.removeItem(at: includeDestDirectory)
        try? FileManager.default.copyItem(at: includeSourceDirectory, to: includeDestDirectory)
    }
}

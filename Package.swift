// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libluajit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(name: "Libluajit", targets: ["Libluajit"]),
    ],
    targets: [
        //DEPENDENCY_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0-alpha/Libluajit.xcframework.zip",
            checksum: "580f272cfe774587fcfc77ae54fc84052c8c1a4ddf1a1b41ae747ddd2e4de04e"
        ),
        //DEPENDENCY_TARGETS_END//
    ]
)

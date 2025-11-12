// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libluajit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(name: "Libluajit", targets: ["_Libluajit"]),
    ],
    targets: [
        // Need a dummy target to embedded correctly.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "_Libluajit",
            dependencies: ["Libluajit"],
            path: "Sources/_Dummy"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0-xcode26/Libluajit.xcframework.zip",
            checksum: "d1ce9cc8668f4b0784f5aab04b35701e964a8aaa4fc5d646f181abdc226654a1"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)

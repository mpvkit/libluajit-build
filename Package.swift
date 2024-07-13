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
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0/Libluajit.xcframework.zip",
            checksum: "72b71ef05124e0aa261b95d78b074965d49ed2915ff5f3bafc54d8c1b2c93dba"
        ),
        //DEPENDENCY_TARGETS_END//
    ]
)

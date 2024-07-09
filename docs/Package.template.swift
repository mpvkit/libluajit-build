// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libluajit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(name: "libluajit", targets: ["Libluajit"]),
    ],
    targets: [
        .binaryTarget(
            name: "Libluajit",
            url: "\(Libluajit_url)",
            checksum: "\(Libluajit_checksum)"
        )
    ]
)

// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libluajit",
    products: [
        .library(
            name: "libluajit",
            type: .static,
            targets: ["Libluajit"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Libluajit",
            url: "\(Libluajit_url)",
            checksum: "\(Libluajit_checksum)"
        )
    ]
)

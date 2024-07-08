// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libluajit",
    products: [
        .library(
            name: "libluajit",
            type: .static,
            targets: ["luajit"]
        ),
    ],
    targets: [
        .target(
            name: "luajit",
            dependencies: [
                "Libluajit"
            ]
        ),
        .binaryTarget(
            name: "Libluajit",
            url: "\(Libluajit_url)",
            checksum: "\(Libluajit_checksum)"
        )
    ]
)

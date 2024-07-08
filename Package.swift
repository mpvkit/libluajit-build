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
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0/Libluajit.xcframework.zip",
            checksum: "e0f460359fdfb43ca1b67a82ef96c65e43b53c897608f75839da246551b63e37"
        )
    ]
)

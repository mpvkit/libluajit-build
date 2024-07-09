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
            checksum: "09d06e40c76e64a354eceb0ae50e44eb81a3fd378efeef9fffc998e380ea366d"
        )
    ]
)

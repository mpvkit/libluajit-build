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
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0/Libluajit.xcframework.zip",
            checksum: "832269bc2d5e16480597564ce52b96503dc75a640f92cc17f7d6d2bc16003e22"
        )
    ]
)

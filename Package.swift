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
            checksum: "54e70aa847aa3e8722db1b07dbbf5134545be8597fa0534dd9f5dfdeaad778c7"
        ),
        //DEPENDENCY_TARGETS_END//
    ]
)

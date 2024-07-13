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
        //DEPENDENCY_TARGETS_END//
    ]
)

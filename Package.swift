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
            checksum: "34ec5116726dc4f866a49cf9654043525e61949a713538541efe8d3475444093"
        ),
        //DEPENDENCY_TARGETS_END//
    ]
)

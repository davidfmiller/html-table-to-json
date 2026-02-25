// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "html-strip-attrs",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.11.3")
    ],
    targets: [
        .executableTarget(
            name: "html-strip-attrs",
            dependencies: [
                .product(name: "SwiftSoup", package: "SwiftSoup")
            ]
        ),
    ]
)

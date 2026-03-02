// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "html-tidy",
    platforms: [.macOS(.v10_15)],
    dependencies: [
      .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.11.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
          name: "html-tidy",
          dependencies: [
            .product(name: "SwiftSoup", package: "SwiftSoup")
          ]
        ),
    ]
)

// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "yaml-to-json",
  platforms: [.macOS(.v10_15)],
  dependencies: [
    .package(url: "https://github.com/jpsim/Yams", from: "5.0.0")
  ],
  targets: [
    .executableTarget(
      name: "yaml-to-json",
      dependencies: [
        .product(name: "Yams", package: "Yams")
      ]
    ),
  ]
)

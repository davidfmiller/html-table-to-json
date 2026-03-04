// swift-tools-version: 6.2


import PackageDescription

let package = Package(
  name: "toml-to-json",
  platforms: [.macOS(.v10_15)],
  dependencies: [
    .package(url: "https://github.com/LebJe/TOMLKit.git", from: "0.6.0")
  ],
  targets: [
    .executableTarget(
      name: "toml-to-json",
      dependencies: [
        .product(name: "TOMLKit", package: "TOMLKit")
      ]
    ),
  ]
)

// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "DnD5eAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "DnD5eAPI", targets: ["DnD5eAPI"]),
    .library(name: "DungeonsAndDragonsMonstersTestMocks", targets: ["DungeonsAndDragonsMonstersTestMocks"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "DnD5eAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
    .target(
      name: "DungeonsAndDragonsMonstersTestMocks",
      dependencies: [
        .product(name: "ApolloTestSupport", package: "apollo-ios"),
        .target(name: "DnD5eAPI"),
      ],
      path: "./DungeonsAndDragonsMonstersTestMocks"
    ),
  ]
)

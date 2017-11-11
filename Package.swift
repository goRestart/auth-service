// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "auth-service",
  products: [
    .library(name: "App", targets: ["App"]),
    .executable(name: "Run", targets: ["Run"])
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.3.0")),
    .package(url: "https://github.com/goRestart/core-service.git", .branch("develop")),
    .package(url: "https://github.com/vapor/jwt.git", .upToNextMajor(from: "2.3.0")),
    .package(url: "https://github.com/goRestart/user-service-api.git", .branch("develop"))
  ],
  targets: [
    .target(name: "App", dependencies: ["Vapor", "CoreService", "user-service-api", "JWT"],
            exclude: [
              "Config",
              "Public",
              "Resources",
              ]),
    .target(name: "Run", dependencies: ["App"])
  ]
)

// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStructures",
    targets: [
        .target(
            name: "DataStructures",
            dependencies: []),
        .testTarget(
            name: "DataStructuresTests",
            dependencies: ["DataStructures"]),
    ]
)

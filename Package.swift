// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "pb3",
    dependencies: [
    .Package(url: "https://github.com/apple/swift-protobuf.git", majorVersion: 0)
    ]
)

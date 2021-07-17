// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "RecursiveTypes",
    products: [
        .library(
            name: "RecursiveTypes",
            targets: ["RecursiveTypes"]),
    ],
    targets: [
        .target(
            name: "RecursiveTypes",
            dependencies: []),
        .testTarget(
            name: "RecursiveTypesTests",
            dependencies: ["RecursiveTypes"]),
    ]
)

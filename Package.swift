// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "swift-matrix-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "Matrix Primitives",
            targets: ["Matrix Primitives"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-algebra-linear-primitives"),
        .package(path: "../swift-vector-primitives"),
        .package(path: "../swift-dimension-primitives"),
        .package(path: "../swift-index-primitives"),
    ],
    targets: [
        .target(
            name: "Matrix Primitives",
            dependencies: [
                .product(name: "Algebra Linear Primitives", package: "swift-algebra-linear-primitives"),
                .product(name: "Vector Primitives", package: "swift-vector-primitives"),
                .product(name: "Dimension Primitives", package: "swift-dimension-primitives"),
                .product(name: "Index Primitives", package: "swift-index-primitives"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}

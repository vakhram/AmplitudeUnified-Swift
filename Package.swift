// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AmplitudeUnified",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v7),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "AmplitudeUnified",
            targets: ["AmplitudeUnified"]),
    ],
    dependencies: [
        .package(url: "https://github.com/amplitude/experiment-ios-client.git", from: "1.19.0"),
        .package(url: "https://github.com/amplitude/AmplitudeSessionReplay-iOS.git", from: "0.8.0"),
        .package(url: "https://github.com/vakhram/Amplitude-Swift.git", from: "1.17.0"),
    ],
    targets: [
        .target(
            name: "AmplitudeUnified",
            dependencies: [
                .product(name: "AmplitudeSwiftVakhram",
                         package: "Amplitude-Swift"),
                .product(name: "AmplitudeSessionReplay",
                         package: "AmplitudeSessionReplay-iOS",
                         condition: .when(platforms: [
                            .iOS,
                         ])),
                .product(name: "Experiment",
                         package: "experiment-ios-client"),
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ]
        ),
        .testTarget(
            name: "AmplitudeUnifiedTests",
            dependencies: [
                .target(name: "AmplitudeUnified"),
            ]
        ),
    ]
)

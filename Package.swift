// swift-tools-version:5.5

import PackageDescription

// Two products, deliberately mutually exclusive. The UI framework
// statically embeds the core module, so depending on both would link
// the Kotlin runtime and every core symbol twice. Pick
// "nepali-date-picker" for the Compose pickers plus the conversion
// engine, or "nepali-date-picker-core" for the conversion engine alone.
let package = Package(
    name: "nepali-date-picker",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "nepali-date-picker", targets: ["nepali-date-picker"]),
        .library(name: "nepali-date-picker-core", targets: ["nepali-date-picker-core"])
    ],
    targets: [
        .binaryTarget(
            name: "nepali-date-picker",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.1.0/nepali_date_picker.xcframework.zip",
            checksum: "67cb81423e95950d9ff198477109da6d97b2c537d6a6c50290eae60a396d8a19"
        ),
        .binaryTarget(
            name: "nepali-date-picker-core",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.1.0/nepali_date_picker_core.xcframework.zip",
            checksum: "1b92e7c58a7cb182dadb36a631bdd1104a7a9af4237164bd5649fb82cf2a865d"
        )
    ]
)

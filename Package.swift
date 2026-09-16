// swift-tools-version:5.5

import PackageDescription

// Two mutually exclusive products: the UI framework embeds core, so linking both
// duplicates the Kotlin runtime and core symbols. Use "nepali-date-picker" for UI +
// conversion, or "nepali-date-picker-core" for conversion only.
//
// "nepali-date-picker-core" supports arm64 macOS; the UI product is iOS-only because
// Compose Multiplatform has no embeddable AppKit host. macOS 12 is the macosArm64
// minimum; Intel Macs are unsupported.
let package = Package(
    name: "nepali-date-picker",
    platforms: [
        .iOS(.v14),
        .macOS(.v12),
    ],
    products: [
        .library(name: "nepali-date-picker", targets: ["nepali-date-picker"]),
        .library(name: "nepali-date-picker-core", targets: ["nepali-date-picker-core"])
    ],
    targets: [
        .binaryTarget(
            name: "nepali-date-picker",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.1.2/nepali_date_picker.xcframework.zip",
            checksum: "96a8e08d35bd52e7f8ac397048178fc9a4d94ccbee2adf502ca291f1457505cc"
        ),
        .binaryTarget(
            name: "nepali-date-picker-core",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.1.2/nepali_date_picker_core.xcframework.zip",
            checksum: "4c635d0f8c2f21419a5c6ff126b094eba1ba31093696bfb066ccaf5f795202c4"
        )
    ]
)

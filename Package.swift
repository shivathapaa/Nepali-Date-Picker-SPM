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
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.2.0/nepali_date_picker.xcframework.zip",
            checksum: "7cea52c06ba8b9d694e5aeda08d04501da830e226121aba1f4fb11c976339462"
        ),
        .binaryTarget(
            name: "nepali-date-picker-core",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.2.0/nepali_date_picker_core.xcframework.zip",
            checksum: "4b050493b7e3bb790d02b6269fbf49140c239c05cc77717f3899adab41add3df"
        )
    ]
)

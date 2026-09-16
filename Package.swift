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
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.1.1/nepali_date_picker.xcframework.zip",
            checksum: "768667146ec86a5f06c1527ecbe75d8b158b3be1420af0d097e781ab4058c892"
        ),
        .binaryTarget(
            name: "nepali-date-picker-core",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases/download/3.1.1/nepali_date_picker_core.xcframework.zip",
            checksum: "86ce20004fa750cdb592655d8b70903074bb0f0464acf86bcb31cfcc62e9901a"
        )
    ]
)

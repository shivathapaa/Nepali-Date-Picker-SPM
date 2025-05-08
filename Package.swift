// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "nepali-date-picker",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "nepali-date-picker", targets: ["nepali-date-picker"])
    ],
    targets: [
        .binaryTarget(
            name: "nepali-date-picker",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker/releases/download/2.3.2/nepali_date_picker.xcframework.zip",
            checksum: "afaa0881cd1a0cd884aa8df08952bd18c2d89be0085a060db5fb8e09f2ed7742"
        )
    ]
)

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
            url: "https://github.com/shivathapaa/Nepali-Date-Picker/releases/download/2.2.6/nepali_date_picker.xcframework.zip",
            checksum: "96fc746d512b37bb1a3c79baf53b13e0392de29b154d7735a3bce75db5b11f41"
        )
    ]
)

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
            url: "https://github.com/shivathapaa/Nepali-Date-Picker/releases/download/2.3.1/nepali_date_picker.xcframework.zip",
            checksum: "a7808195dc70ada31e65b1d40d65b017a21d30d0a6c60f74fac833cd4e5b7fe6"
        )
    ]
)

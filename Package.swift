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
            url: "https://github.com/shivathapaa/Nepali-Date-Picker/releases/download/2.3.0/nepali_date_picker.xcframework.zip",
            checksum: "323a3afaaf2b5fc724e1efe325aab03816afea2b67f2165cce5404a988ec3b69"
        )
    ]
)

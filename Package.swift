// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "nepali-date-picker",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "nepali-date-picker", targets: ["nepali-date-picker"])
    ],
    targets: [
        .binaryTarget(
            name: "nepali-date-picker",
            url: "https://github.com/shivathapaa/Nepali-Date-Picker/releases/download/2.2.3/nepali_date_picker.xcframework.zip",
            checksum: "a5c37e8f4a7d39c279183a4271caf6e9cf09474ec6001507bc0418e5de71bb68"
        )
    ]
)

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
            url: "https://github.com/shivathapaa/Nepali-Date-Picker/releases/download/2.2.5/nepali_date_picker.xcframework.zip",
            checksum: "0ca28b44296ac772a9081b669d79d31d656c6ea9c7376e2c18a3214fa4d1dd30"
        )
    ]
)

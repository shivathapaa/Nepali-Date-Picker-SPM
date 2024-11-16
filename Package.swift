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
            url: "https://github.com/shivathapaa/Nepali-Date-Picker/releases/download/2.2.4/nepali_date_picker.xcframework.zip",
            checksum: "5c4d1dd1e55b82afe063594eb4ef7a7448fe041611317160cdbaa9285ecde41a"
        )
    ]
)

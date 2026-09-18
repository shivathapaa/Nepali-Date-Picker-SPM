# Nepali-Date-Picker-SPM

<p align="center">
  <img src="https://raw.githubusercontent.com/shivathapaa/Nepali-Date-Picker/main/.github/assets/nepaliDatePickerBanner.png" alt="" width="100%">
</p>

The Swift Package Manager distribution of the
[Nepali Date Picker](https://github.com/shivathapaa/Nepali-Date-Picker): a **Bikram Sambat (Nepali)
date picker** for iOS, plus a headless **BS ↔ AD conversion, comparison and formatting engine** for
iOS and macOS.

<p align="center">
  <a href="https://github.com/shivathapaa/Nepali-Date-Picker-SPM/releases">
    <img alt="version" src="https://img.shields.io/github/v/release/shivathapaa/Nepali-Date-Picker-SPM?label=spm%20release" /></a>&nbsp;
  <a href="https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/LICENSE">
    <img alt="license" src="https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg"/></a>
</p>

> ## 📖 [Full documentation →](https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/README-spm.md)
>
> Installation, the required Xcode settings, every picker and the complete engine API live in the
> main repository, so there is a single source of truth. This page covers only what you need to add
> the package.

> **This repository is generated.** It carries only `Package.swift` and the XCFramework release
> assets, both rewritten automatically on every release of the library. Do not edit `Package.swift`
> by hand. Open issues and pull requests against the
> [main repository](https://github.com/shivathapaa/Nepali-Date-Picker/issues).

## Requirements

iOS 14+, Swift tools 5.5+, **arm64 only** (device and Apple silicon simulator; there is no `x86_64`
slice). The engine product also runs on **macOS 12+** (Apple silicon). Supported range: BS
**1970–2100**, AD **1913–2043**.

## Which product to pick

**Depend on exactly one.**

| Product | Contains | Platforms | Swift import | Download |
| --- | --- | --- | --- | --- |
| `nepali-date-picker` | The Compose pickers **plus** the full conversion engine | iOS 14+ | `nepali_date_picker` | ~60 MB |
| `nepali-date-picker-core` | The conversion engine only, no UI | iOS 14+, macOS 12+ | `nepali_date_picker_core` | ~4 MB |

> **Never add both.** Each XCFramework is a self-contained static binary and the UI framework already
> embeds the core module, so linking both duplicates the Kotlin runtime and every core symbol.

> **macOS gets the engine, not the pickers.** `nepali-date-picker-core` carries a `macos-arm64`
> slice, so a Mac app has the full conversion, comparison and formatting API. The pickers stay
> iOS-only: they are hosted in a `UIViewController`, and Compose Multiplatform publishes no
> embeddable AppKit host. A macOS target that links `nepali-date-picker` fails to build with
> `no library for this platform was found`; depend on `nepali-date-picker-core` there instead.

## Installation

In Xcode: **File → Add Package Dependencies…**, paste the URL, choose a version, then pick one of the
two library products.

```
https://github.com/shivathapaa/Nepali-Date-Picker-SPM.git
```

Or in your own `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/shivathapaa/Nepali-Date-Picker-SPM.git", from: "3.1.2")
],
targets: [
    .target(name: "App", dependencies: [
        .product(name: "nepali-date-picker", package: "Nepali-Date-Picker-SPM")
        // macOS target: the engine product is the one that links
        // .product(name: "nepali-date-picker-core", package: "Nepali-Date-Picker-SPM")
    ])
]
```

```swift
import nepali_date_picker      // pickers + engine
// or
import nepali_date_picker_core // engine only
```

## Before you build

Three project settings are load-bearing. Without them the app fails to link, fails to compile, or
crashes on launch. The
[full documentation](https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/README-spm.md#required-xcode-configuration)
explains each one and how to supply the plist key.

| Setting | Value |
| --- | --- |
| `EXCLUDED_ARCHS[sdk=iphonesimulator*]` | `x86_64` |
| `PRODUCT_MODULE_NAME` | anything not equal to `nepali_date_picker` ignoring case |
| `CADisableMinimumFrameDurationOnPhone` in `Info.plist` | `YES` (UI product only) |

## A taste

```swift
import nepali_date_picker

let converter = NepaliDateConverter.shared

converter.todayNepaliCalendar                                             // today in Bikram Sambat
converter.convertEnglishToNepali(englishYYYY: 2024, englishMM: 3, englishDD: 21)
converter.formatNepaliDate(customCalendar: converter.todayNepaliCalendar, locale: locale)
```

The pickers are Compose Multiplatform hosted in a `UIViewController`, so SwiftUI embeds them through
a `UIViewControllerRepresentable`. A complete SwiftUI sample lives at
[`sample/iosSwiftApp`](https://github.com/shivathapaa/Nepali-Date-Picker/tree/main/sample/iosSwiftApp).
See
[The pickers](https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/README-spm.md#part-1---the-pickers)
for the wrapper, the sizing rules and every variant.

Every calendar picker can display the Gregorian calendar instead, with a `B.S.` / `A.D.` switch the
user can flip, and can fill the grid's empty cells with the neighbouring months' days. The date handed
back to Swift is always Bikram Sambat, so switching keeps the same day selected.

## Links

- **[Full documentation](https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/README-spm.md)**
- [Main repository](https://github.com/shivathapaa/Nepali-Date-Picker)
- [API reference](https://shivathapaa.github.io/Nepali-Date-Picker/api/)
- [Sample Swift iOS Project](https://github.com/shivathapaa/Nepali-Date-Picker/tree/main/sample/iosSwiftApp)
- Other platforms, all sharing the same calendar tables, so results match:
    - **Kotlin / Android / KMP** - [main README](https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/README.md),
      on [Maven Central](https://central.sonatype.com/namespace/io.github.shivathapaa)
    - **JavaScript / web** - [README-js.md](https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/README-js.md),
      [`@nepali-date-picker/web-component`](https://www.npmjs.com/package/@nepali-date-picker/web-component)
      and [`@nepali-date-picker/core`](https://www.npmjs.com/package/@nepali-date-picker/core) on npm
    - **Python / backend** - [`nepali_calendar_utils`](https://github.com/shivathapaa/nepali_calendar_utils)
      on PyPI

## License

[Mozilla Public License 2.0 (MPL 2.0)](https://github.com/shivathapaa/Nepali-Date-Picker/blob/main/LICENSE)

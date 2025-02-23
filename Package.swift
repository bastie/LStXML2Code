// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LStXML2Code",
    platforms: [.macOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LStXML2Code",
            targets: ["LStXML2Code"]),
        .executable(name: "BMF2Code", targets: ["BMF2Code"])
    ],
    dependencies: [
      .package(
        url: "https://github.com/bastie/JavApi4Swift.git",
        from: "0.25.0"
      )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LStXML2Code"),
        .testTarget(
            name: "LStXML2CodeTests",
            dependencies: ["LStXML2Code",
                       .product(name: "JavApi", package: "JavApi4Swift")
        ]),
        .executableTarget(
          name: "BMF2Code",
          dependencies: ["LStXML2Code"]),
    ]
)

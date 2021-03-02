// swift-tools-version:5.3

//
// Package.swift
//
// Created by Iris de la Luna <iris@random.town> on 2021/03/01.
//
// This is free and unencumbered software released into the public domain.
// Please, read the [full license](./UNLICENSE.md) before using.
//

import PackageDescription

/// Swift implementation of circular shifts (a.k.a. bitwise rotation).
///
let package = Package(
	name: "CircularShift",
	platforms:
		[
			.macOS(.v10_15),
			.iOS(.v13),
			.tvOS(.v13),
			.watchOS(.v6),
		],
	products:
		[
			.library(
				name: "CircularShift",
				targets: ["CircularShift"]
			),
		],
	targets:
		[
			.target(
				name: "CircularShift",
				path: "Sources"
			),
			.testTarget(
				name: "CircularShiftTests",
				dependencies: ["CircularShift"],
				path: "Tests/Units"
			),
			.testTarget(
				name: "CircularShiftBenchmarks",
				dependencies: ["CircularShift"],
				path: "Tests/Benchmarks"
			),
		]
)

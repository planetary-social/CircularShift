//
// CircularShiftPerformanceTests.swift
// CircularShiftBenchmarks
//
// Created by Iris de la Luna <iris@random.town> on 2021/03/01.
//
// This is free and unencumbered software released into the public domain.
// Please, read the [full license](./../../UNLICENSE.md) before using.
//

import CircularShift
import XCTest

// MARK: Benchmarking Circular Shift Operations

/// Here we test the speed of bitwise rotation for fixed-width integers.
///
/// All tests start with a single random value, then continuously rotate it in place billions of times over.
///
/// - Remark:
///   For brevity, only `UInt32` is being tested here.
///
final class CircularShiftPerformanceTests: XCTestCase {

	/// The amount of iterations, each one invoking given rotation exactly 33 times.
	///
	let sampleSize = 10_000_000 // * 33 in total

	// MARK: Measurements

	func testRotateLeft() {
		var x = UInt32.random(in: .min...(.max))
		measure { for _ in 0..<sampleSize { for n in 0...32 { x <<<= n } } }
	}

	func testRotateRight() {
		var x = UInt32.random(in: .min...(.max))
		measure { for _ in 0..<sampleSize { for n in 0...32 { x >>>= n } } }
	}
}

//
// CircularShiftTests.swift
// CircularShiftTests
//
// Created by Iris de la Luna <iris@random.town> on 2021/03/01.
//
// This is free and unencumbered software released into the public domain.
// Please, read the [full license](./../../UNLICENSE.md) before using.
//

import CircularShift
import XCTest

// MARK: The Test Suite

/// ...
///
final class CircularShiftTests: XCTestCase {

	// MARK: Simplified Rotation Examples

	/// The results of bitwise rotation should match all of the hand-written examples.
	///
	/// All of the examples have been additionally verified using C implementation from NaCL cryptographic library.
	/// Several sets are provided for integers of various size.
	///
	func testSimpleExamples() {
		AssertEachPairEqual<UInt8>(
			(0b10000000 <<< 4, 0b00001000),
			(0b11110000 >>> 2, 0b00111100),
			(0b00000111 <<< 3, 0b00111000),
			(0b10101010 >>> 1, 0b01010101),
			(0b11100000 <<< 2, 0b10000011),
			(0b10111001 >>> 5, 0b11001101)
		)
		AssertEachPairEqual<UInt16>(
			(0b1000000000000000 <<< 4, 0b0000000000001000),
			(0b1111000000000000 >>> 2, 0b0011110000000000),
			(0b0000000011100000 <<< 3, 0b0000011100000000),
			(0b1010101010101010 >>> 1, 0b0101010101010101),
			(0b1110000000000000 <<< 2, 0b1000000000000011),
			(0b1000000001110001 >>> 5, 0b1000110000000011)
		)
		AssertEachPairEqual<UInt32>(
			(0b10000000000000000000000000000000 <<< 4, 0b00000000000000000000000000001000),
			(0b11110000000000000000000000000000 >>> 2, 0b00111100000000000000000000000000),
			(0b00000000000000011100000000000000 <<< 3, 0b00000000000011100000000000000000),
			(0b10101010101010101010101010101010 >>> 1, 0b01010101010101010101010101010101),
			(0b11100000000000000000000000000000 <<< 2, 0b10000000000000000000000000000011),
			(0b10000000000000000011100000000001 >>> 5, 0b00001100000000000000000111000000)
		)
	}

	private struct AssertEachPairEqual<I: FixedWidthInteger> {
		@discardableResult
		init(_ examples: (I, I)..., file: StaticString = #file, line: UInt = #line) {
			for (i, (actual, expected)) in examples.enumerated() {
				XCTAssertEqual(
					actual, expected,
					file: file, line: line + UInt(i) + 1
				)
			}
		}
	}
}

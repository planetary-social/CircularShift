//
// CircularShiftSamplePairs.swift
// CircularShiftTests
//
// Created by Iris de la Luna <iris@random.town> on 2021/03/01.
//
// This is free and unencumbered software released into the public domain.
// Please, read the [full license](./../../UNLICENSE.md) before using.
//

// MARK: Generating Test Samples

/// A sequence of value and offset pairs suitable as test samples.
///
struct CircularShiftSamplePairs<I: FixedWidthInteger>: Sequence {

	init() { }

	func makeIterator() -> Iterator { .init() }

	/// Generates a random pair of numbers in each iteration.
	///
	/// First of the numbers is the value to be rotated, second one is the rotation offset.
	/// The value can range over the entire domain of its type, while the offset is never greater than the bit-width of that type.
	///
	struct Iterator: IteratorProtocol {
		func next() -> (value: I, offset: I)? {
			(I.random(in: .min...(.max)), I.random(in: 0...I(I.bitWidth)))
		}
	}
}

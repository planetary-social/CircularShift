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

struct CircularShiftSamplePairs<I: FixedWidthInteger>: Sequence {

	init() { }

	func makeIterator() -> Iterator { .init() }

	struct Iterator: IteratorProtocol {
		func next() -> (value: I, offset: I)? {
			(I.random(in: .min...(.max)), I.random(in: 0...I(I.bitWidth)))
		}
	}
}

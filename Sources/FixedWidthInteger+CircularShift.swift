//
// FixedWidthInteger+CircularShift.swift
// CircularShift
//
// Created by Iris de la Luna <iris@random.town> on 2021/03/01.
//
// This is free and unencumbered software released into the public domain.
// Please, read the [full license](./../UNLICENSE.md) before using.
//

// MARK: Circular Shift Operators

/// These are the bitwise rotation operators with the same precedence as the logical shifts.
///
/// - Remark:
///   Since the shifts are traditionally defined as `<<` and `>>`, it is a common convention to use `<<<` and `>>>` for circular shifts whenever the language allows for custom operator declarations.
///

infix operator <<< : BitwiseShiftPrecedence
infix operator >>> : BitwiseShiftPrecedence

// MARK: Mutating Variants

/// These are the bitwise rotation assignments, allowing to mutate the left-hand-side variable.
///

infix operator <<<= : AssignmentPrecedence
infix operator >>>= : AssignmentPrecedence

// MARK: Default Implementation for Any Fixed-width Integer

public extension FixedWidthInteger {

	@inlinable @inline(__always)
	static func <<< <RHS: BinaryInteger>(lhs: Self, rhs: RHS) -> Self {
		0
	}

	@inlinable @inline(__always)
	static func <<<= <RHS: BinaryInteger>(lhs: inout Self, rhs: RHS) {
	}

	@inlinable @inline(__always)
	static func >>> <RHS: BinaryInteger>(lhs: Self, rhs: RHS) -> Self {
		0
	}

	@inlinable @inline(__always)
	static func >>>= <RHS: BinaryInteger>(lhs: inout Self, rhs: RHS) {
	}
}

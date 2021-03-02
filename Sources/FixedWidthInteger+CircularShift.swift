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

/// Since we have access to `FixedWidthInteger.bitWidth`, it is easy to generalize the implementation of circular shifts for all the conformant integer types.
///
/// - Note:
///   All the rotation operators accept a generic offset (right-hand-side) operand;
///   Any `BinaryInteger` can act as the offset, however...
///
/// - Important:
///   The offset must be no larger than the bit-width of the concrete integer type on left-hand-side.
///   For example, the offset must be smaller than or equal to 8 for `Int8`, smaller than or equal to 16 for `Int16`, and so on.
///   Due to performance reasons, it is the caller's responsability to ensure this property.
///   Too large offset will inevitably crash the progam with the value overlow.
///
public extension FixedWidthInteger {

	/// Returns the result of rotating a value’s binary representation the specified number of digits to the left.
	///
	@inlinable @inline(__always)
	static func <<< <RHS: BinaryInteger>(lhs: Self, rhs: RHS) -> Self {
		lhs &<< rhs | lhs &>> (Self.bitWidth &- Int(rhs))
	}

	/// Stores the result of rotating a value’s binary representation the specified number of digits to the left in the left-hand-side variable.
	///
	@inlinable @inline(__always)
	static func <<<= <RHS: BinaryInteger>(lhs: inout Self, rhs: RHS) {
	}

	/// Returns the result of rotating a value’s binary representation the specified number of digits to the right.
	///
	@inlinable @inline(__always)
	static func >>> <RHS: BinaryInteger>(lhs: Self, rhs: RHS) -> Self {
		lhs &>> rhs | lhs &<< (Self.bitWidth &- Int(rhs))
	}

	/// Stores the result of rotating a value’s binary representation the specified number of digits to the right in the left-hand-side variable.
	///
	@inlinable @inline(__always)
	static func >>>= <RHS: BinaryInteger>(lhs: inout Self, rhs: RHS) {
	}
}

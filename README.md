# Circular Shift

![Wheel](./Documentation/Images/Hero.jpg)

## Abstract

A [bitwise rotation](https://en.wikipedia.org/wiki/Bitwise_rotation), also known as a **circular shift**, is a bitwise operation that shifts all bits of its operand. In this operation, sometimes called *rotate no carry*, the bits are "rotated" as if the left and right ends of the register were joined. Unlike an [arithmetic shift](https://en.wikipedia.org/wiki/Arithmetic_shift), a circular shift does not preserve a number's sign bit, and unlike a [logical shift](https://en.wikipedia.org/wiki/Logical_shift), the vacant bit positions are not filled in with zeros but are filled in with the bits shifted out of the sequence. This is useful when necessary to retain all the existing bits, as it is frequently the case in cryptography (for example to permute bit sequences). Unfortunately, many programming languages, including C and Swift, do not have operators or standard functions for circular shifting, even though virtually all processors have such instructions (e.g. [Intel x86](https://en.wikipedia.org/wiki/Intel_x86) has `ROL` and `ROR`). This package provides an implementation of circular shifts written in Swift.

## Usage Instructions

Our `CircularShift` module extends the `FixedWidthInteger` with two bitwise shifts. In order to make use of these in your program, start by imporing the module:

```swift
import CircularShift
```

Now you have access to  `<<<` and `>>>` operators (and their mutating variants `<<<=` and `>>>=`), allowing you to rotate the bits of an integer to the left or to the right, respectively. Here is how these work:

```swift
0b00010111 as UInt8 <<< 1 == 0b00101110
0b00010111 as UInt8 >>> 1 == 0b10001011
```

We've got two 8-bit integers, both rotated one position, first one to the left, the other one to the right. Rotating bits to the left moves the most significant bit to the least significant position, and vice versa in case of rotation to the right; all other bits are shifted in the respective direction. _Show, don't tell_, both examples can be simply visualised as follows:

![Circular Shifts Diagram](Documentation/Images/CircularShiftsDiagram.svg)

Keep in mind, that depending on the offset, more bits will be moved around. Also note these rotations work for any type conforming to `FixedWidthInteger`, according to its bit-width:

```swift
0b1000000001110001 as UInt32 >>> 5 == 0b1000110000000011
```

Of course, there is no need to express the operand in binary, the example above could be perfectly well written in decimal representation. Here is an example using the mutating variant (rotate and assign):

```swift
var x: UInt32 = 32881
x >>>= 5 
x == 0b1000110000000011
```

As you can easily verify, the result is exactly the same.

## Performance Considerations

Swift is an [optimizing compiler](https://en.wikipedia.org/wiki/Optimizing_compiler), which in a nutshell means it is actively trying to minimize the size of generated machine code in order to achieve faster execution times. In a _perfect world_, the most obvious implementation (like this one) should be effectively compiled down to equivalent of the  `ROL` and `ROR` instructions, whenever the target architecture supports them, thus ensuring the maximum performance.

That said, there's no guarantee of such optimization taking place. Nevertheless, no steps have been taken to optimize this implementation manually, i.e. by bridging C or ASM variants into Swift. The reason is simple: good optimizing compiler *must* optimize this sort of trivial code correctly in order to be a good optimizing compiler, otherwise what's the point? In other words, why bother using an optimizing compiler, if at the end of the day we're forced to get our hands dirty writing explicit assembly instructions? 

If you notice the resulting machine code (compiled in release mode) is not being optimized correctly, do not hesitate to let the Swift development team know by [reporting a bug](https://swift.org/contributing/#reporting-bugs), unless you know for sure it happens because of our mistake, then please [let us know](https://github.com/planetary-social/CircularShift/issues) instead.

## Implementation Details

- [FixedWidthInteger+CircularShift.swift](Sources/FixedWidthInteger+CircularShift.swift)
- [CircularShiftSamplePairs.swift](Tests/Units/CircularShiftSamplePairs.swift)
- [CircularShiftTests.swift](Tests/Units/CircularShiftTests.swift)
- [CircularShiftPerformanceTests.swift](Tests/Benchmarks/CircularShiftPerformanceTests.swift)

## Acknowledgements

- Cover photo by [shade jay](https://unsplash.com/@shadejay) on [Unsplash](https://unsplash.com/photos/COr3Mvxs4Po).
- Bitwise circular shift graphics based on the works of [Colin M.L. Burnett](https://en.wikipedia.org/wiki/User:Cburnett) on [Wikipedia](https://en.wikipedia.org/wiki/Circular_shift).
- Documentation and code are largely based on the Wikipedia articles about [circular shifts](https://en.wikipedia.org/wiki/Circular_shift) and [bitwise operations](https://en.wikipedia.org/wiki/Bitwise_operation#bit_rotation).

## Copyleft Notice

This project is humbly [unlicensed](https://unlicense.org).

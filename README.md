# Circular Shift

![Wheel](./Documentation/Images/Hero.jpg)

## Abstract

A [bitwise rotation](https://en.wikipedia.org/wiki/Bitwise_rotation), also known as a **circular shift**, is a bitwise operation that shifts all bits of its operand. In this operation, sometimes called *rotate no carry*, the bits are "rotated" as if the left and right ends of the register were joined. Unlike an [arithmetic shift](https://en.wikipedia.org/wiki/Arithmetic_shift), a circular shift does not preserve a number's sign bit, and unlike a [logical shift](https://en.wikipedia.org/wiki/Logical_shift), the vacant bit positions are not filled in with zeros but are filled in with the bits shifted out of the sequence. This is useful when necessary to retain all the existing bits, as it is frequently the case in cryptography (for example to permute bit sequences). Unfortunately, many programming languages, including C and Swift, do not have operators or standard functions for circular shifting, even though virtually all processors have such instructions (e.g. [Intel x86](https://en.wikipedia.org/wiki/Intel_x86) has `ROL` and `ROR`). This package provides an implementation of circular shifts written in Swift.

## Copyleft Notice

This project is humbly [unlicensed](https://unlicense.org).

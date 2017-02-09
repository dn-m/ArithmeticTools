//
//  BitwiseOperationsTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/8/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
@testable import ArithmeticTools

class BitwiseOperationsTests: XCTestCase {
    
    func testLog2IntPowerOfTwo() {
        let x = 1 << 4
        XCTAssertEqual(log2(powerOfTwo: x), 4)
    }
    
    func testInvertSameZero() {
        
        let powerOfTwo = 1 << 0
        let max = 0
        let result = invert(powerOfTwo: powerOfTwo, within: max)
        let expected = 0
        
        XCTAssertEqual(result, expected)
    }
    
    func testInvert() {

        let powerOfTwo = 1 << 6
        let max = 7
        let result = 1 << invert(powerOfTwo: powerOfTwo, within: max)
        let expected = 1 << 1
        
        XCTAssertEqual(result, expected)
    }

	func testCLZ() {
		XCTAssertEqual(countLeadingZeros(-1), 0)
		XCTAssertEqual(countLeadingZeros(-112348123), 0)
		XCTAssertEqual(countLeadingZeros(-2), 0)
		XCTAssertEqual(countLeadingZeros(-0x8000000000000000), 0)

		XCTAssertEqual(countLeadingZeros(0), intBitCount)
		XCTAssertEqual(countLeadingZeros(1), intBitCount-1)
		XCTAssertEqual(countLeadingZeros(3), intBitCount-2)
		XCTAssertEqual(countLeadingZeros(0x7FFFFFFFFFFFFFFF), 1)
		XCTAssertEqual(countLeadingZeros(0x3FFFFFFFFFFFFFFF), 2)
		XCTAssertEqual(countLeadingZeros(0x0FFFFFFFFFFFFFFF), 4)
	}

	func testCTZ() {
		XCTAssertEqual(countTrailingZeros(-1), 0)
		XCTAssertEqual(countTrailingZeros(-112348124), 2)
		XCTAssertEqual(countTrailingZeros(-2), 1)
		XCTAssertEqual(countTrailingZeros(-0x8000000000000000), intBitCount-1)

		XCTAssertEqual(countTrailingZeros(0), intBitCount)
		XCTAssertEqual(countTrailingZeros(1), 0)
		XCTAssertEqual(countTrailingZeros(2), 1)
		XCTAssertEqual(countTrailingZeros(0x1000000000000000), 60)
		XCTAssertEqual(countTrailingZeros(0x2000000000000000), 61)
		XCTAssertEqual(countTrailingZeros(0x1ABCDEF400000000), 4 * 8 + 2)
	}
}

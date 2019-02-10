//
//  PerformanceTests.swift
//  PerformanceTests
//
//  Created by fnord on 2/9/19.
//  Copyright © 2019 twof. All rights reserved.
//

import XCTest

class PerformanceTests: XCTestCase {
    /*
     The deal with these two tests is that they are both linear, but I'd like to get a feel for
     the constant overhead. Hashing should be linear over one of the origin, and then
     a compare of the hash value against a precomputed hash of the target. Linear comparisons would
     be linear over both the origin and target.
    */
    
    func testHashComparePerformance() {
        let precomputedHash = "hello".hashValue

        self.measure {
            for _ in 0...10_000_000 {
                "hello".hashValue == precomputedHash
            }
        }
    }
    
//    func testLinearUTF8ComparePerformance() {
//        let origin = "hello".utf8
//        let target = "hello".utf8
//
//        self.measure {
//            for _ in 0...10_000_000 {
//                origin.elementsEqual(target)
//            }
//        }
//    }
//
//    func testLinearStringComparePerformance() {
//        let origin = "hello"
//        let target = "hello"
//
//        self.measure {
//            for _ in 0...10_000_000 {
//                origin.elementsEqual(target)
//            }
//        }
//    }

    func testEqualityStringComparePerformance() {
        let origin = "hello😍"
        let target = "hello😍"
        var isMatch = false

        self.measure {
            for _ in 0...10_000_000 {
                isMatch = origin == target
            }
        }

        print(isMatch)
    }

    func testCaseInsensitiveStringComparePerformance() {
        let origin = "hello"
        let target = "Hello"
        var isMatch = false

        self.measure {
            for _ in 0...10_000_000 {
                isMatch = origin == target.lowercased()
            }
        }

        XCTAssert(isMatch)
    }
}

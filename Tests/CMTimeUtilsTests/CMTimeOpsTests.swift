@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeOpsTests: XCTestCase {
  func testEqualityWithFloat64() {
    let time = CMTime(seconds: 10, preferredTimescale: 600)
    XCTAssertTrue(time == 10.0)
    XCTAssertFalse(time == 10.1)
  }

  func testInequalityWithFloat64() {
    let time = CMTime(seconds: 5, preferredTimescale: 600)
    XCTAssertTrue(time != 5.1)
    XCTAssertFalse(time != 5.0)
  }

  func testLessThanWithFloat64() {
    let time = CMTime(seconds: 3, preferredTimescale: 600)
    XCTAssertTrue(time < 3.1)
    XCTAssertFalse(time < 3.0)
  }

  func testGreaterThanWithFloat64() {
    let time = CMTime(seconds: 8, preferredTimescale: 600)
    XCTAssertTrue(time > 7.9)
    XCTAssertFalse(time > 8.0)
  }

  func testLessThanOrEqualToWithFloat64() {
    let time = CMTime(seconds: 2, preferredTimescale: 600)
    XCTAssertTrue(time <= 2.0)
    XCTAssertTrue(time <= 2.1)
    XCTAssertFalse(time <= 1.9)
  }

  func testGreaterThanOrEqualToWithFloat64() {
    let time = CMTime(seconds: 9, preferredTimescale: 600)
    XCTAssertTrue(time >= 9.0)
    XCTAssertTrue(time >= 8.9)
    XCTAssertFalse(time >= 9.1)
  }

  func testAdditionOfCMTime() {
    var lhs = CMTime(seconds: 1, preferredTimescale: 600)
    let rhs = CMTime(seconds: 2, preferredTimescale: 600)
    lhs += rhs
    XCTAssertEqual(lhs.seconds, 3)
  }

  func testSubtractionOfCMTime() {
    var lhs = CMTime(seconds: 5, preferredTimescale: 600)
    let rhs = CMTime(seconds: 2, preferredTimescale: 600)
    lhs -= rhs
    XCTAssertEqual(lhs.seconds, 3)
  }

  func testMultiplicationOfCMTimeWithInt() {
    let time = CMTime(seconds: 2, preferredTimescale: 600)
    let result = time * 3
    XCTAssertEqual(result.seconds, 6)
  }

  func testDivisionOfCMTimeByInt() {
    let time = CMTime(seconds: 6, preferredTimescale: 600)
    let result = time / 2
    XCTAssertEqual(result.seconds, 3)
  }

  func testMultiplicationOfCMTimeWithFloat64() {
    let time = CMTime(seconds: 2, preferredTimescale: 600)
    let result = time * 1.5
    XCTAssertEqual(result.seconds, 3)
  }

  func testMultiplicationAssignmentWithInt() {
    var time = CMTime(seconds: 4, preferredTimescale: 600)
    time *= 2
    XCTAssertEqual(time.seconds, 8)
  }

  func testMultiplicationAssignmentWithFloat64() {
    var time = CMTime(seconds: 3, preferredTimescale: 600)
    time *= 1.5
    XCTAssertEqual(time.seconds, 4.5)
  }

  func testDivisionAssignmentWithInt() {
    var time = CMTime(seconds: 8, preferredTimescale: 600)
    time /= 2
    XCTAssertEqual(time.seconds, 4)
  }
}

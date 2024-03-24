@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeSplitTests: XCTestCase {
  func testSplitByCMTime() {
    let time = CMTime(seconds: 5, preferredTimescale: 600)
    let (left, right) = time.split(by: CMTime(seconds: 2, preferredTimescale: 600))

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 2, preferredTimescale: 600), "The end of the left range should be the split time")
    XCTAssertEqual(right.start, CMTime(seconds: 2, preferredTimescale: 600), "The start of the right range should be the split time")
    XCTAssertEqual(right.end, time, "The end of the right range should be the original time")
  }

  func testSplitByCMTimeValue() {
    let time = CMTime(seconds: 10, preferredTimescale: 600)
    let (left, right) = time.split(by: 3600) // 6 seconds

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 6, preferredTimescale: 600), "The end of the left range should be the split time")
    XCTAssertEqual(right.start, CMTime(seconds: 6, preferredTimescale: 600), "The start of the right range should be the split time")
    XCTAssertEqual(right.end, time, "The end of the right range should be the original time")
  }

  func testSplitByCMTimeOutOfRange() {
    let time = CMTime(seconds: 3, preferredTimescale: 600)
    let (left, right) = time.split(by: CMTime(seconds: 5, preferredTimescale: 600)) // Out of range

    XCTAssertEqual(left, CMTimeRange.invalid, "The left range should be invalid when split time is out of range")
    XCTAssertEqual(right, CMTimeRange.invalid, "The right range should be invalid when split time is out of range")
  }

  func testMidTime() {
    let range = CMTimeRange(start: CMTime(seconds: 2, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600))
    let midTime = range.midTime

    XCTAssertEqual(midTime, CMTime(seconds: 6, preferredTimescale: 600), "The midTime should be the midpoint of the range")
  }

  func testSplitByMidTime() {
    let time = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600))
    let (left, right) = time.splitByMidTime()

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 5, preferredTimescale: 600), "The end of the left range should be the midpoint of the original range")
    XCTAssertEqual(right.start, CMTime(seconds: 5, preferredTimescale: 600), "The start of the right range should be the midpoint of the original range")
    XCTAssertEqual(right.end, CMTime(seconds: 10, preferredTimescale: 600), "The end of the right range should be the end of the original range")
  }
}

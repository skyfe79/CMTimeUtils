@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeRangeSplitTests: XCTestCase {
  func testSplitByCMTime() {
    let range = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600))
    let splitTime = CMTime(seconds: 4, preferredTimescale: 600)
    let (left, right) = range.split(by: splitTime)

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, splitTime, "The end of the left range should be the split time")
    XCTAssertEqual(right.start, splitTime, "The start of the right range should be the split time")
    XCTAssertEqual(right.end, CMTime(seconds: 10, preferredTimescale: 600), "The end of the right range should be the end of the original range")
  }

  func testSplitByCMTimeValue() {
    let range = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 12, preferredTimescale: 600))
    let (left, right) = range.split(by: 3600) // 6 seconds

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 6, preferredTimescale: 600), "The end of the left range should be the split time")
    XCTAssertEqual(right.start, CMTime(seconds: 6, preferredTimescale: 600), "The start of the right range should be the split time")
    XCTAssertEqual(right.end, CMTime(seconds: 12, preferredTimescale: 600), "The end of the right range should be the end of the original range")
  }

  func testSplitByCMTimeOutOfRange() {
    let range = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 3, preferredTimescale: 600))
    let (left, right) = range.split(by: CMTime(seconds: 5, preferredTimescale: 600)) // Out of range

    XCTAssertEqual(left, CMTimeRange.invalid, "The left range should be invalid when split time is out of range")
    XCTAssertEqual(right, CMTimeRange.invalid, "The right range should be invalid when split time is out of range")
  }

  func testSplitByMidTime() {
    let range = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600))
    let (left, right) = range.splitByMidTime()

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 5, preferredTimescale: 600), "The end of the left range should be the midpoint of the original range")
    XCTAssertEqual(right.start, CMTime(seconds: 5, preferredTimescale: 600), "The start of the right range should be the midpoint of the original range")
    XCTAssertEqual(right.end, CMTime(seconds: 10, preferredTimescale: 600), "The end of the right range should be the end of the original range")
  }

  func testSplitFromStartToSeconds() {
    let range = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600))
    let (left, right) = range.splitFromStartTo(seconds: 3)

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 3, preferredTimescale: 600), "The end of the left range should be 3 seconds")
    XCTAssertEqual(right.start, CMTime(seconds: 3, preferredTimescale: 600), "The start of the right range should be 3 seconds")
    XCTAssertEqual(right.end, CMTime(seconds: 10, preferredTimescale: 600), "The end of the right range should be the end of the original range")
  }

  func testSplitFromEndToSeconds() {
    let range = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600))
    let (left, right) = range.splitFromEndTo(seconds: 3)

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 3, preferredTimescale: 600), "The end of the left range should be 3 seconds")
    XCTAssertEqual(right.start, CMTime(seconds: 3, preferredTimescale: 600), "The start of the right range should be 3 seconds")
    XCTAssertEqual(right.end, CMTime(seconds: 10, preferredTimescale: 600), "The end of the right range should be the end of the original range")
  }

  func testSplitFromEndToNegativeSeconds() {
    let range = CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600))
    let (left, right) = range.splitFromEndTo(seconds: -3)

    XCTAssertEqual(left.start, CMTime.zero, "The start of the left range should be zero")
    XCTAssertEqual(left.end, CMTime(seconds: 7, preferredTimescale: 600), "The end of the left range should be 7 seconds, as it's 3 seconds before the end")
    XCTAssertEqual(right.start, CMTime(seconds: 7, preferredTimescale: 600), "The start of the right range should be 7 seconds")
    XCTAssertEqual(right.end, CMTime(seconds: 10, preferredTimescale: 600), "The end of the right range should be the end of the original range")
  }
}

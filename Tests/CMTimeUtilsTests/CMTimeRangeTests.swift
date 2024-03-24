@testable import CMTimeUtils
import CoreMedia
import XCTest

final class CMTimeRangeTests: XCTestCase {
  func testCMTimeRangeProperty() {
    let fiveSeconds = CMTime(seconds: 5, preferredTimescale: 600)
    let range = fiveSeconds.range

    XCTAssertEqual(range.start, CMTime.zero, "The start of the range should be zero.")
    XCTAssertEqual(range.end, fiveSeconds, "The end of the range should be five seconds.")
  }

  func testRangeFromZero() {
    let tenSeconds = CMTime(seconds: 10, preferredTimescale: 600)
    let range = tenSeconds.range
    XCTAssertEqual(range.start, CMTime.zero, "The start of the range should be zero.")
    XCTAssertEqual(range.end, tenSeconds, "The end of the range should be ten seconds.")
  }

  func testRangeWithDuration() {
    let start = CMTime(seconds: 5, preferredTimescale: 600)
    let duration = CMTime(seconds: 10, preferredTimescale: 600)
    let range = start.range(duration: duration)
    XCTAssertEqual(range.start, start, "The start of the range should be five seconds.")
    XCTAssertEqual(range.duration, duration, "The duration of the range should be ten seconds.")
  }

  func testRangeWithDurationValue() {
    let start = CMTime(seconds: 5, preferredTimescale: 600)
    let durationValue: CMTimeValue = 6000 // 10 seconds
    let range = start.range(duration: durationValue)
    XCTAssertEqual(range.start, start, "The start of the range should be five seconds.")
    XCTAssertEqual(range.duration, CMTime(seconds: 10, preferredTimescale: 600), "The duration of the range should be ten seconds.")
  }

  func testRangeToEnd() {
    let start = CMTime(seconds: 5, preferredTimescale: 600)
    let end = CMTime(seconds: 15, preferredTimescale: 600)
    let range = start.range(to: end)
    XCTAssertEqual(range.start, start, "The start of the range should be five seconds.")
    XCTAssertEqual(range.end, end, "The end of the range should be fifteen seconds.")
  }
}

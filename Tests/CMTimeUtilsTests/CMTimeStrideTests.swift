@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeStrideTests: XCTestCase {
  func testStrideFromToByCMTime() {
    let start = CMTime(seconds: 1, preferredTimescale: 600)
    let end = CMTime(seconds: 5, preferredTimescale: 600)
    let increment = CMTime(seconds: 1, preferredTimescale: 600)
    let expectedTimes = [
      CMTime(seconds: 1, preferredTimescale: 600),
      CMTime(seconds: 2, preferredTimescale: 600),
      CMTime(seconds: 3, preferredTimescale: 600),
      CMTime(seconds: 4, preferredTimescale: 600),
    ]
    XCTAssertEqual(CMTime.stride(from: start, to: end, by: increment), expectedTimes)
  }

  func testStrideFromToByCMTimeValue() {
    let start = CMTime(seconds: 0, preferredTimescale: 600)
    let end = CMTime(seconds: 3, preferredTimescale: 600)
    let incrementValue: CMTimeValue = 30 // 0.05 seconds
    let expectedTimes = [
      CMTime(seconds: 0, preferredTimescale: 600),
      CMTime(seconds: 0.05, preferredTimescale: 600),
      CMTime(seconds: 0.1, preferredTimescale: 600),
      CMTime(seconds: 0.15, preferredTimescale: 600),
      CMTime(seconds: 0.2, preferredTimescale: 600),
      CMTime(seconds: 0.25, preferredTimescale: 600),
      CMTime(seconds: 0.3, preferredTimescale: 600),
      CMTime(seconds: 0.35, preferredTimescale: 600),
      CMTime(seconds: 0.4, preferredTimescale: 600),
      CMTime(seconds: 0.45, preferredTimescale: 600),
      CMTime(seconds: 0.5, preferredTimescale: 600),
      CMTime(seconds: 0.55, preferredTimescale: 600),
      CMTime(seconds: 0.6, preferredTimescale: 600),
      CMTime(seconds: 0.65, preferredTimescale: 600),
      CMTime(seconds: 0.7, preferredTimescale: 600),
      CMTime(seconds: 0.75, preferredTimescale: 600),
      CMTime(seconds: 0.8, preferredTimescale: 600),
      CMTime(seconds: 0.85, preferredTimescale: 600),
      CMTime(seconds: 0.9, preferredTimescale: 600),
      CMTime(seconds: 0.95, preferredTimescale: 600),
      CMTime(seconds: 1, preferredTimescale: 600),
      CMTime(seconds: 1.05, preferredTimescale: 600),
      CMTime(seconds: 1.1, preferredTimescale: 600),
      CMTime(seconds: 1.15, preferredTimescale: 600),
      CMTime(seconds: 1.2, preferredTimescale: 600),
      CMTime(seconds: 1.25, preferredTimescale: 600),
      CMTime(seconds: 1.3, preferredTimescale: 600),
      CMTime(seconds: 1.35, preferredTimescale: 600),
      CMTime(seconds: 1.4, preferredTimescale: 600),
      CMTime(seconds: 1.45, preferredTimescale: 600),
      CMTime(seconds: 1.5, preferredTimescale: 600),
      CMTime(seconds: 1.55, preferredTimescale: 600),
      CMTime(seconds: 1.6, preferredTimescale: 600),
      CMTime(seconds: 1.65, preferredTimescale: 600),
      CMTime(seconds: 1.7, preferredTimescale: 600),
      CMTime(seconds: 1.75, preferredTimescale: 600),
      CMTime(seconds: 1.8, preferredTimescale: 600),
      CMTime(seconds: 1.85, preferredTimescale: 600),
      CMTime(seconds: 1.9, preferredTimescale: 600),
      CMTime(seconds: 1.95, preferredTimescale: 600),
      CMTime(seconds: 2, preferredTimescale: 600),
      CMTime(seconds: 2.05, preferredTimescale: 600),
      CMTime(seconds: 2.1, preferredTimescale: 600),
      CMTime(seconds: 2.15, preferredTimescale: 600),
      CMTime(seconds: 2.2, preferredTimescale: 600),
      CMTime(seconds: 2.25, preferredTimescale: 600),
      CMTime(seconds: 2.3, preferredTimescale: 600),
      CMTime(seconds: 2.35, preferredTimescale: 600),
      CMTime(seconds: 2.4, preferredTimescale: 600),
      CMTime(seconds: 2.45, preferredTimescale: 600),
      CMTime(seconds: 2.5, preferredTimescale: 600),
      CMTime(seconds: 2.55, preferredTimescale: 600),
      CMTime(seconds: 2.6, preferredTimescale: 600),
      CMTime(seconds: 2.65, preferredTimescale: 600),
      CMTime(seconds: 2.7, preferredTimescale: 600),
      CMTime(seconds: 2.75, preferredTimescale: 600),
      CMTime(seconds: 2.8, preferredTimescale: 600),
      CMTime(seconds: 2.85, preferredTimescale: 600),
      CMTime(seconds: 2.9, preferredTimescale: 600),
      CMTime(seconds: 2.95, preferredTimescale: 600),
    ]
    XCTAssertEqual(CMTime.stride(from: start, to: end, by: incrementValue), expectedTimes)
  }

  func testStrideFromSelfByCMTime() {
    let start = CMTime(seconds: 2, preferredTimescale: 600)
    let increment = CMTime(seconds: 0.5, preferredTimescale: 600)
    let end = CMTime(seconds: 4, preferredTimescale: 600)
    let expectedTimes = [
      CMTime(seconds: 2, preferredTimescale: 600),
      CMTime(seconds: 2.5, preferredTimescale: 600),
      CMTime(seconds: 3, preferredTimescale: 600),
      CMTime(seconds: 3.5, preferredTimescale: 600),
    ]
    XCTAssertEqual(start.stride(to: end, by: increment), expectedTimes)
  }
}

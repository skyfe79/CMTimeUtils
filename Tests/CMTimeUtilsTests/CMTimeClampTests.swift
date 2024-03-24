import XCTest

@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeClampTests: XCTestCase {
  func testClampWithinRange() {
    let time = CMTime(seconds: 5, preferredTimescale: 600)
    let minValue = CMTime(seconds: 3, preferredTimescale: 600)
    let maxValue = CMTime(seconds: 7, preferredTimescale: 600)
    let clampedTime = time.clamp(minValue, maxValue)
    XCTAssertEqual(clampedTime.seconds, 5)
  }

  func testClampBelowMinimum() {
    let time = CMTime(seconds: 2, preferredTimescale: 600)
    let minValue = CMTime(seconds: 3, preferredTimescale: 600)
    let maxValue = CMTime(seconds: 7, preferredTimescale: 600)
    let clampedTime = time.clamp(minValue, maxValue)
    XCTAssertEqual(clampedTime.seconds, 3)
  }

  func testClampAboveMaximum() {
    let time = CMTime(seconds: 8, preferredTimescale: 600)
    let minValue = CMTime(seconds: 3, preferredTimescale: 600)
    let maxValue = CMTime(seconds: 7, preferredTimescale: 600)
    let clampedTime = time.clamp(minValue, maxValue)
    XCTAssertEqual(clampedTime.seconds, 7)
  }

  func testClampToRange() {
    let time = CMTime(seconds: 5, preferredTimescale: 600)
    let range = CMTime(seconds: 3, preferredTimescale: 600) ... CMTime(seconds: 7, preferredTimescale: 600)
    let clampedTime = time.clamp(to: range)
    XCTAssertEqual(clampedTime.seconds, 5)
  }

  func testClampToRangeWithZeroDuration() {
    let time = CMTime(seconds: 5, preferredTimescale: 600)
    let range = CMTime(seconds: 3, preferredTimescale: 600) ... CMTime(seconds: 3, preferredTimescale: 600)
    let clampedTime = time.clamp(to: range)
    XCTAssertEqual(clampedTime.seconds, 3)
  }

  func testClampeBelowMinimumRange() {
    let time = CMTime(seconds: 2, preferredTimescale: 600)
    let range = CMTime(seconds: 3, preferredTimescale: 600) ... CMTime(seconds: 7, preferredTimescale: 600)
    let clampedTime = time.clamp(to: range)
    XCTAssertEqual(clampedTime.seconds, 3)
  }

  func testClampAboveMaximumRange() {
    let time = CMTime(seconds: 8, preferredTimescale: 600)
    let range = CMTime(seconds: 3, preferredTimescale: 600) ... CMTime(seconds: 7, preferredTimescale: 600)
    let clampedTime = time.clamp(to: range)
    XCTAssertEqual(clampedTime.seconds, 7)
  }
}

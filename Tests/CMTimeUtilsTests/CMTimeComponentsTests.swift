@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeComponentsTests: XCTestCase {
  func testSecondsAsFloat() {
    let time = CMTime(seconds: 123.45, preferredTimescale: 600)
    XCTAssertEqual(time.f, Float(123.45), accuracy: 0.001)
  }

  func testSecondsAsFloat64() {
    let time = CMTime(seconds: 123.45, preferredTimescale: 600)
    XCTAssertEqual(time.f64, 123.45, accuracy: 0.001)
  }

  func testSingleHour() {
    let oneHour = 3600.0
    let time = CMTime(seconds: oneHour, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 1)
  }

  func testTwoHours() {
    let oneHour = 3600.0
    let time = CMTime(seconds: 2 * oneHour, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 2)
  }

  func testOneHourNineMinutes() {
    let oneHour = 3600.0
    let nineMinutes = 9 * 60.0
    let time = CMTime(seconds: oneHour + nineMinutes, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 1)
    XCTAssertEqual(time.minutes, 9)
  }

  func testOneHourNineMinutesThirtySeconds() {
    let oneHour = 3600.0
    let nineMinutes = 9 * 60.0
    let thirtySeconds = 30.0
    let time = CMTime(seconds: oneHour + nineMinutes + thirtySeconds, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 1)
    XCTAssertEqual(time.minutes, 9)
  }

  func testThirtySeconds() {
    let oneHour = 3600.0
    let nineMinutes = 9 * 60.0
    let thirtySeconds = 30.0
    let time = CMTime(seconds: oneHour + nineMinutes + thirtySeconds, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 1)
    XCTAssertEqual(time.minutes, 9)
    XCTAssertEqual(time.secs, 30)
  }

  func testThreeHoursTwentyEightMinutes() {
    let oneHour = 3600.0
    let nineMinutes = 9 * 60.0
    let thirtySeconds = 30.0
    let time = CMTime(seconds: (3 * oneHour) + (3 * nineMinutes) + (2 * thirtySeconds), preferredTimescale: 600)
    XCTAssertEqual(time.hours, 3)
    XCTAssertEqual(time.minutes, 28)
    XCTAssertEqual(time.secs, 0)
  }

  func testMilliseconds() {
    let oneHour = 3600.0
    let nineMinutes = 9 * 60.0
    let thirtySeconds = 30.0
    let time = CMTime(seconds: oneHour + nineMinutes + thirtySeconds, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 1)
    XCTAssertEqual(time.minutes, 9)
    XCTAssertEqual(time.secs, 30)
    XCTAssertEqual(time.millisecs, 30000)
  }

  func testNanoseconds() {
    let oneHour = 3600.0
    let nineMinutes = 9 * 60.0
    let thirtySeconds = 30.0
    let time = CMTime(seconds: oneHour + nineMinutes + thirtySeconds, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 1)
    XCTAssertEqual(time.minutes, 9)
    XCTAssertEqual(time.secs, 30)
    XCTAssertEqual(time.nanosecs, 30_000_000_000)
  }

  func testCMTimeInitializationWithHoursMinutesSeconds() {
    let cmTime = CMTime(hours: 1, minutes: 30, seconds: 45, preferredTimescale: 600)
    XCTAssertEqual(cmTime.hours, 1)
    XCTAssertEqual(cmTime.minutes, 30)
    XCTAssertEqual(cmTime.secs, 45)
    XCTAssertEqual(cmTime.timescale, 600)
  }

  func testAllComponents() {
    let oneHour = 3600.0
    let nineMinutes = 9 * 60.0
    let thirtySeconds = 30.0
    let time = CMTime(seconds: oneHour + nineMinutes + thirtySeconds, preferredTimescale: 600)
    XCTAssertEqual(time.hours, 1)
    XCTAssertEqual(time.minutes, 9)
    XCTAssertEqual(time.secs, 30)
    XCTAssertEqual(time.millisecs, 30000)
    XCTAssertEqual(time.nanosecs, 30_000_000_000)
    let components = time.components
    XCTAssertEqual(components.hours, 1)
    XCTAssertEqual(components.minutes, 9)
    XCTAssertEqual(components.secs, 30)
    XCTAssertEqual(components.milliseconds, 30000)
    XCTAssertEqual(components.nanosecs, 30_000_000_000)
  }
}

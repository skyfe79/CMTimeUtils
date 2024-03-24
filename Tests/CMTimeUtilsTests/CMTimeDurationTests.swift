@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeDurationTests: XCTestCase {
  func testDurationProperty() {
    let tenSeconds = CMTimeMake(value: 10, timescale: 1)
    let expectedDuration = CMTimeMake(value: 10, timescale: 1)

    let duration = tenSeconds.duration

    XCTAssertEqual(duration, expectedDuration)
  }

  func testDuration() {
    let startTime = CMTime(seconds: 10, preferredTimescale: 600)
    let endTime = CMTime(seconds: 20, preferredTimescale: 600)

    let duration = CMTime.duration(from: startTime, to: endTime)

    XCTAssertEqual(duration.seconds, 10)
  }

  func testNegativeDuration() {
    let startTime = CMTime(seconds: 20, preferredTimescale: 600)
    let endTime = CMTime(seconds: 10, preferredTimescale: 600)

    let duration = CMTime.duration(from: startTime, to: endTime)

    XCTAssertEqual(duration.seconds, -10)
  }

  func testDurationTo() {
    let startTime = CMTime(seconds: 10, preferredTimescale: 600)
    let endTime = CMTime(seconds: 20, preferredTimescale: 600)
    let expectedDuration = CMTime(seconds: 10, preferredTimescale: 600)

    let duration = startTime.duration(to: endTime)

    XCTAssertEqual(duration, expectedDuration)
  }

  func testDurationFrom() {
    let startTime = CMTime(seconds: 5, preferredTimescale: 600)
    let currentTime = CMTime(seconds: 15, preferredTimescale: 600)
    let expectedDuration = CMTime(seconds: 10, preferredTimescale: 600)

    let duration = currentTime.duration(from: startTime)

    XCTAssertEqual(duration, expectedDuration)
  }

  func testDurationWithNegativeValues() {
    let startTime = CMTime(seconds: -5, preferredTimescale: 600)
    let endTime = CMTime(seconds: 5, preferredTimescale: 600)
    let expectedDuration = CMTime(seconds: 10, preferredTimescale: 600)

    let durationTo = startTime.duration(to: endTime)
    let durationFrom = endTime.duration(from: startTime)

    XCTAssertEqual(durationTo, expectedDuration)
    XCTAssertEqual(durationFrom, expectedDuration)
  }

  func testDurationWithZero() {
    let startTime = CMTime.zero
    let endTime = CMTime(seconds: 10, preferredTimescale: 600)
    let expectedDurationTo = CMTime(seconds: 10, preferredTimescale: 600)
    let expectedDurationFrom = CMTime(seconds: 10, preferredTimescale: 600)

    let durationTo = startTime.duration(to: endTime)
    let durationFrom = endTime.duration(from: startTime)

    XCTAssertEqual(durationTo, expectedDurationTo)
    XCTAssertEqual(durationFrom, expectedDurationFrom)
  }
}

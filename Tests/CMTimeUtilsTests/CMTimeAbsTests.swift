@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeAbsTests: XCTestCase {
  func testAbsoluteValuePositive() {
    let positiveTime = CMTime(seconds: 120, preferredTimescale: 600)
    let absoluteTime = positiveTime.abs()
    XCTAssertEqual(absoluteTime.seconds, 120)
  }

  func testAbsoluteValueNegative() {
    let negativeTime = CMTime(seconds: -120, preferredTimescale: 600)
    let absoluteTime = negativeTime.abs()
    XCTAssertEqual(absoluteTime.seconds, 120)
  }
}

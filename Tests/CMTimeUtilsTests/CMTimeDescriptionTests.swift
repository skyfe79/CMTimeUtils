@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeDescriptionTests: XCTestCase {
  func testDescription() {
    let time = CMTime(seconds: 10, preferredTimescale: 600)
    XCTAssertEqual(time.description, "10.0", "The description of CMTime should correctly represent its seconds.")
  }

  func testDebugDescription() {
    let time = CMTime(seconds: 5, preferredTimescale: 600)
    let expectedDebugDescription = String(describing: CMTimeCopyDescription(allocator: nil, time: time))
    XCTAssertEqual(time.debugDescription, expectedDebugDescription, "The debug description of CMTime should match the output of CMTimeCopyDescription.")
  }
}

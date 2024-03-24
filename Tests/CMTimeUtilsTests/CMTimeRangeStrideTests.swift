@testable import CMTimeUtils
import CoreMedia
import XCTest

class CMTimeRangeStrideTests: XCTestCase {
  func testStrideByCMTime() {
    let start = CMTime(seconds: 1, preferredTimescale: 600)
    let end = CMTime(seconds: 10, preferredTimescale: 600)
    let step = CMTime(seconds: 2, preferredTimescale: 600)
    let range = CMTimeRange(start: start, end: end)

    let stridedRanges = CMTimeRange.stride(range: range, by: step)

    XCTAssertEqual(stridedRanges.count, 5, "Expected 5 strided ranges")
    XCTAssertEqual(stridedRanges.first?.start, start, "The start of the first range should match the original start")
    XCTAssertEqual(stridedRanges.last?.end, end, "The end of the last range should match the original end")
  }

  func testStrideByCMTimeValue() {
    let start = CMTime(seconds: 0, preferredTimescale: 600)
    let end = CMTime(seconds: 5, preferredTimescale: 600)
    let stepValue: CMTimeValue = 600 // 1 second
    let range = CMTimeRange(start: start, end: end)

    let stridedRanges = CMTimeRange.stride(range: range, by: stepValue)

    XCTAssertEqual(stridedRanges.count, 5, "Expected 5 strided ranges")
    XCTAssertEqual(stridedRanges.first?.start, start, "The start of the first range should match the original start")
    XCTAssertEqual(stridedRanges.last?.end, end, "The end of the last range should match the original end")
  }

  func testStrideByCMTimeAndCheckValues() {
    let start = CMTime(seconds: 1, preferredTimescale: 600)
    let end = CMTime(seconds: 10, preferredTimescale: 600)
    let step = CMTime(seconds: 2, preferredTimescale: 600)
    let range = CMTimeRange(start: start, end: end)

    let expectedRanges = [
      CMTimeRange(start: CMTime(seconds: 1, preferredTimescale: 600), end: CMTime(seconds: 3, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 3, preferredTimescale: 600), end: CMTime(seconds: 5, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 5, preferredTimescale: 600), end: CMTime(seconds: 7, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 7, preferredTimescale: 600), end: CMTime(seconds: 9, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 9, preferredTimescale: 600), end: CMTime(seconds: 10, preferredTimescale: 600)),
    ]
    let stridedRanges = CMTimeRange.stride(range: range, by: step)

    XCTAssertEqual(stridedRanges.count, 5, "Expected 5 strided ranges")
    XCTAssertEqual(stridedRanges.first?.start, start, "The start of the first range should match the original start")
    XCTAssertEqual(stridedRanges.last?.end, end, "The end of the last range should match the original end")
    XCTAssertEqual(stridedRanges, expectedRanges, "The strided ranges should match the expected ranges")
  }

  func testStrideByCMTimeValueAndCheckValues() {
    let start = CMTime(seconds: 0, preferredTimescale: 600)
    let end = CMTime(seconds: 5, preferredTimescale: 600)
    let stepValue: CMTimeValue = 600 // 1 second
    let range = CMTimeRange(start: start, end: end)

    let expectedRanges = [
      CMTimeRange(start: CMTime(seconds: 0, preferredTimescale: 600), end: CMTime(seconds: 1, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 1, preferredTimescale: 600), end: CMTime(seconds: 2, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 2, preferredTimescale: 600), end: CMTime(seconds: 3, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 3, preferredTimescale: 600), end: CMTime(seconds: 4, preferredTimescale: 600)),
      CMTimeRange(start: CMTime(seconds: 4, preferredTimescale: 600), end: CMTime(seconds: 5, preferredTimescale: 600)),
    ]
    let stridedRanges = CMTimeRange.stride(range: range, by: stepValue)

    XCTAssertEqual(stridedRanges.count, 5, "Expected 5 strided ranges")
    XCTAssertEqual(stridedRanges.first?.start, start, "The start of the first range should match the original start")
    XCTAssertEqual(stridedRanges.last?.end, end, "The end of the last range should match the original end")
    XCTAssertEqual(stridedRanges, expectedRanges, "The strided ranges should match the expected ranges")
  }
}

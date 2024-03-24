import CoreMedia
import Foundation

public extension CMTimeRange {
  /// Generates an array of `CMTimeRange` objects by striding over a given range with a specified step.
  ///
  /// - Parameters:
  ///   - range: The `CMTimeRange` to be strided over.
  ///   - step: The step size as `CMTime` to use for each stride.
  /// - Returns: An array of `CMTimeRange` objects created by striding over the given range.
  static func stride(range: CMTimeRange, by step: CMTime) -> [CMTimeRange] {
    var ranges = [CMTimeRange]()
    var start = range.start
    let end = CMTimeRangeGetEnd(range)

    while CMTimeCompare(start, end) < 0 {
      let nextStart = CMTimeAdd(start, step)
      let currentEnd = CMTimeMinimum(nextStart, end)
      let currentRange = CMTimeRangeFromTimeToTime(start: start, end: currentEnd)
      ranges.append(currentRange)
      start = nextStart
    }

    return ranges
  }

  /// Generates an array of `CMTimeRange` objects by striding over a given range with a specified step size as `CMTimeValue`.
  ///
  /// - Parameters:
  ///   - range: The `CMTimeRange` to be strided over.
  ///   - step: The step size as `CMTimeValue` to use for each stride.
  /// - Returns: An array of `CMTimeRange` objects created by striding over the given range.
  static func stride(range: CMTimeRange, by step: CMTimeValue) -> [CMTimeRange] {
    let timescale = range.start.timescale
    return stride(range: range, by: CMTime(value: step, timescale: timescale))
  }
}

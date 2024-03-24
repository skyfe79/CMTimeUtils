import CoreMedia
import Foundation

public extension CMTime {
  /// Calculates the midpoint of a `CMTime` range.
  var midTime: CMTime {
    let start = range.start
    let end = range.end
    return start + (end - start) / 2
  }

  /// Splits a `CMTime` range into two ranges at a specified `CMTime`.
  ///
  /// - Parameter time: The `CMTime` at which to split the range.
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the specified time. Returns invalid ranges if the time is not within the range.
  func split(by time: CMTime) -> (left: CMTimeRange, right: CMTimeRange) {
    guard CMTimeRangeContainsTime(range, time: time) else {
      return (left: CMTimeRange.invalid, right: CMTimeRange.invalid)
    }

    let start = CMTime.zero
    let end = self

    let leftRange = CMTimeRangeFromTimeToTime(start: start, end: time)
    let rightRange = CMTimeRangeFromTimeToTime(start: time, end: end)

    return (leftRange, rightRange)
  }

  /// Splits a `CMTime` range into two ranges at a specified `CMTimeValue`.
  ///
  /// - Parameter value: The `CMTimeValue` at which to split the range.
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the specified value.
  func split(by value: CMTimeValue) -> (left: CMTimeRange, right: CMTimeRange) {
    let time = CMTime(value: value, timescale: timescale)
    return split(by: time)
  }

  /// Splits a `CMTime` range into two ranges at its midpoint.
  ///
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the midpoint.
  func splitByMidTime() -> (left: CMTimeRange, right: CMTimeRange) {
    return split(by: midTime)
  }
}

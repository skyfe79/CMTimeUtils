import CoreMedia
import Foundation

/// An extension to `CMTimeRange` to provide functionality for splitting time ranges.
public extension CMTimeRange {
  /// Calculates the midpoint of the time range.
  var midTime: CMTime {
    return start + (end - start) / 2
  }

  /// Splits the time range into two ranges at a specified `CMTime`.
  ///
  /// - Parameter time: The `CMTime` at which to split the range.
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the specified time. Returns invalid ranges if the time is not within the range.
  func split(by time: CMTime) -> (left: CMTimeRange, right: CMTimeRange) {
    guard CMTimeRangeContainsTime(self, time: time) else {
      return (left: CMTimeRange.invalid, right: CMTimeRange.invalid)
    }
    let leftRange = CMTimeRange(start: start, end: time)
    let rightRange = CMTimeRange(start: time, end: end)
    return (leftRange, rightRange)
  }

  /// Splits the time range into two ranges at a specified `CMTimeValue`.
  ///
  /// - Parameter value: The `CMTimeValue` at which to split the range.
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the specified value.
  func split(by value: CMTimeValue) -> (left: CMTimeRange, right: CMTimeRange) {
    let time = CMTime(value: value, timescale: start.timescale)
    return split(by: time)
  }

  /// Splits the time range into two ranges at its midpoint.
  ///
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the midpoint.
  func splitByMidTime() -> (left: CMTimeRange, right: CMTimeRange) {
    return split(by: midTime)
  }

  /// Splits the time range into two ranges at a specified `CMTime`.
  ///
  /// - Parameter seconds: The seconds at which to split the range.
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the specified time.
  func splitFromStartTo(seconds: Double) -> (left: CMTimeRange, right: CMTimeRange) {
    let time = CMTime(seconds: seconds, preferredTimescale: start.timescale)
    return split(by: time)
  }

  /// Splits the time range into two ranges at a specified `CMTime`.
  ///
  /// - Parameter seconds: The seconds at which to split the range.
  /// - Returns: A tuple containing the left and right `CMTimeRange` split at the specified time.
  func splitFromEndTo(seconds: Double) -> (left: CMTimeRange, right: CMTimeRange) {
    let time: CMTime
    if seconds < 0 {
      time = CMTime(seconds: duration.seconds + seconds, preferredTimescale: duration.timescale)
    } else {
      time = CMTime(seconds: seconds, preferredTimescale: end.timescale)
    }
    return split(by: time)
  }
}

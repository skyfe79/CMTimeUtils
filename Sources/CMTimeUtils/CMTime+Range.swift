import CoreMedia
import Foundation

public extension CMTime {
  /// Returns a `CMTimeRange` starting from zero to the instance's time.
  var range: CMTimeRange {
    CMTime.zero.range(to: self)
  }

  /// Creates a `CMTimeRange` starting from the instance's time with a specified duration.
  /// - Parameter duration: The duration of the range.
  /// - Returns: A `CMTimeRange` object.
  func range(duration: CMTime) -> CMTimeRange {
    CMTimeRange(start: self, duration: duration)
  }

  /// Creates a `CMTimeRange` starting from the instance's time with a specified duration in `CMTimeValue`.
  /// - Parameter duration: The duration of the range in `CMTimeValue`.
  /// - Returns: A `CMTimeRange` object.
  func range(duration: CMTimeValue) -> CMTimeRange {
    let endTime = self + CMTime(value: duration, timescale: timescale)
    return range(to: endTime)
  }

  /// Creates a `CMTimeRange` from the instance's time to a specified end time.
  /// - Parameter endTime: The end time of the range.
  /// - Returns: A `CMTimeRange` object.
  func range(to endTime: CMTime) -> CMTimeRange {
    let duration = endTime - self
    return CMTimeRange(start: self, duration: duration)
  }
}

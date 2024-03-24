import CoreMedia
import Foundation

public extension CMTime {
  /// Calculates the duration from zero to the instance's time.
  var duration: CMTime {
    return CMTime.zero.duration(to: self)
  }

  /// Calculates the duration between two `CMTime` values.
  /// - Parameters:
  ///   - startTime: The start time of the duration.
  ///   - endTime: The end time of the duration.
  /// - Returns: The duration as a `CMTime`.
  static func duration(from startTime: CMTime, to endTime: CMTime) -> CMTime {
    return endTime - startTime
  }

  /// Calculates the duration from the instance to another `CMTime`.
  /// - Parameter endTime: The end time of the duration.
  /// - Returns: The duration as a `CMTime`.
  func duration(to endTime: CMTime) -> CMTime {
    return endTime - self
  }

  /// Calculates the duration from another `CMTime` to the instance.
  /// - Parameter startTime: The start time of the duration.
  /// - Returns: The duration as a `CMTime`.
  func duration(from startTime: CMTime) -> CMTime {
    return self - startTime
  }
}

import CoreMedia
import Foundation

extension CMTime {
  /// Clamps the CMTime to a specified minimum and maximum value.
  ///
  /// This method ensures that the CMTime's seconds do not fall below the minimum value's seconds or exceed the maximum value's seconds.
  ///
  /// - Parameters:
  ///   - minValue: The minimum CMTime value.
  ///   - maxValue: The maximum CMTime value.
  /// - Returns: A new CMTime object clamped between the minValue and maxValue.
  func clamp(_ minValue: CMTime, _ maxValue: CMTime) -> CMTime {
    let clampedSeconds = min(max(seconds, minValue.seconds), maxValue.seconds)
    return CMTime(seconds: clampedSeconds, preferredTimescale: timescale)
  }

  /// Clamps the CMTime to a specified range.
  ///
  /// This method ensures that the CMTime's seconds do not fall below the range's lower bound seconds or exceed the range's upper bound seconds.
  ///
  /// - Parameter range: The range within which to clamp the CMTime.
  /// - Returns: A new CMTime object clamped within the specified range.
  func clamp(to range: ClosedRange<CMTime>) -> CMTime {
    return clamp(range.lowerBound, range.upperBound)
  }
}

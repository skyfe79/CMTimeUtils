import CoreMedia
import Foundation

public extension CMTime {
  /// Calculates the absolute value of the CMTime.
  ///
  /// - Returns: A CMTime representing the absolute value.
  func abs() -> CMTime {
    return CMTimeAbsoluteValue(self)
  }
}

import CoreMedia
import Foundation

/// Provides utility functions for generating sequences of `CMTime` values.
public extension CMTime {
  /// Creates an array of `CMTime` values starting from `start`, incrementing by `value`, and ending before `end`.
  ///
  /// - Parameters:
  ///   - start: The starting `CMTime`.
  ///   - end: The ending `CMTime`, which is not included in the result.
  ///   - value: The increment value as `CMTime`.
  /// - Returns: An array of `CMTime` values.
  static func stride(from start: CMTime, to end: CMTime, by value: CMTime) -> [CMTime] {
    var times = [CMTime]()
    var current = start
    while current < end {
      times.append(current)
      current = current + value
    }
    return times
  }

  /// Creates an array of `CMTime` values starting from `start`, incrementing by a `CMTimeValue`, and ending before `end`.
  ///
  /// - Parameters:
  ///   - start: The starting `CMTime`.
  ///   - end: The ending `CMTime`, which is not included in the result.
  ///   - value: The increment value as `CMTimeValue`.
  /// - Returns: An array of `CMTime` values.
  static func stride(from start: CMTime, to end: CMTime, by value: CMTimeValue) -> [CMTime] {
    return stride(from: start, to: end, by: CMTime(value: value, timescale: start.timescale))
  }

  /// Creates an array of `CMTime` values starting from `self`, incrementing by `value`, and ending before `end`.
  ///
  /// - Parameters:
  ///   - end: The ending `CMTime`, which is not included in the result.
  ///   - value: The increment value as `CMTime`.
  /// - Returns: An array of `CMTime` values.
  func stride(to end: CMTime, by value: CMTime) -> [CMTime] {
    return CMTime.stride(from: self, to: end, by: value)
  }

  /// Creates an array of `CMTime` values starting from `self`, incrementing by `value`, and ending before `end` represented as an `Int`.
  ///
  /// - Parameters:
  ///   - end: The ending value as `Int`, which is converted to `CMTime` and not included in the result.
  ///   - value: The increment value as `Int`, which is converted to `CMTime`.
  /// - Returns: An array of `CMTime` values.
  func stride(to end: Int, by value: Int) -> [CMTime] {
    let endTime = CMTime(value: CMTimeValue(end), timescale: timescale)
    let byTime = CMTime(value: CMTimeValue(value), timescale: timescale)
    return stride(to: endTime, by: byTime)
  }

  /// Creates an array of `CMTime` values starting from `start`, incrementing by `value`, and ending before `self`.
  ///
  /// - Parameters:
  ///   - start: The starting `CMTime`.
  ///   - value: The increment value as `CMTime`.
  /// - Returns: An array of `CMTime` values.
  func stride(from start: CMTime, by value: CMTime) -> [CMTime] {
    return CMTime.stride(from: start, to: self, by: value)
  }

  /// Creates an array of `CMTime` values starting from `start` represented as an `Int`, incrementing by `value`, and ending before `self`.
  ///
  /// - Parameters:
  ///   - start: The starting value as `Int`, which is converted to `CMTime`.
  ///   - value: The increment value as `Int`, which is converted to `CMTime`.
  /// - Returns: An array of `CMTime` values.
  func stride(from start: Int, by value: Int) -> [CMTime] {
    let startTime = CMTime(value: CMTimeValue(start), timescale: timescale)
    let byTime = CMTime(value: CMTimeValue(value), timescale: timescale)
    return stride(from: startTime, by: byTime)
  }

  /// Creates an array of `CMTime` values starting from zero, incrementing by `value`.
  ///
  /// - Parameter value: The increment value as `CMTime`.
  /// - Returns: An array of `CMTime` values.
  func stride(by value: CMTime) -> [CMTime] {
    return stride(from: CMTime.zero, by: value)
  }

  /// Creates an array of `CMTime` values starting from zero, incrementing by `value` represented as an `Int`.
  ///
  /// - Parameter value: The increment value as `Int`, which is converted to `CMTime`.
  /// - Returns: An array of `CMTime` values.
  func stride(by value: Int) -> [CMTime] {
    return stride(by: CMTime(value: CMTimeValue(value), timescale: timescale))
  }
}

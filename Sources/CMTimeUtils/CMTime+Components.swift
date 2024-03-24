import CoreMedia
import Foundation

public extension CMTime {
  /// Returns the value of the CMTime in seconds as a `Float`.
  var f: Float {
    return Float(f64)
  }

  /// Returns the value of the CMTime in seconds as a `Float64`.
  var f64: Float64 {
    return CMTimeGetSeconds(self)
  }

  /// Returns the number of hours represented by the CMTime instance.
  var hours: Int {
    return Int(seconds / 3600)
  }

  /// Returns the number of minutes in the CMTime value.
  var minutes: Int {
    return Int(seconds.truncatingRemainder(dividingBy: 3600)) / 60
  }

  /// Returns the seconds component of the CMTime value as an integer.
  var secs: Int {
    return Int(seconds.truncatingRemainder(dividingBy: 60))
  }

  /// Returns the value of the CMTime in milliseconds.
  var millisecs: Int {
    return secs * 1000
  }

  /// Returns the value of the CMTime instance in nanoseconds.
  var nanosecs: Int {
    return secs * 1_000_000_000
  }
}

public extension CMTime {
  /// Initializes a CMTime with the specified hours, minutes, and seconds.
  ///
  /// - Parameters:
  ///   - hours: The number of hours.
  ///   - minutes: The number of minutes.
  ///   - seconds: The number of seconds.
  ///   - preferredTimescale: The preferred timescale for the CMTime.
  init(hours: Int, minutes: Int, seconds: Int, preferredTimescale: Int32) {
    let totalSeconds = Double(hours * 3600 + minutes * 60 + seconds)
    self.init(seconds: totalSeconds, preferredTimescale: preferredTimescale)
  }

  /// Returns the components of the CMTime instance.
  ///
  /// - Returns: A tuple containing the hours, minutes, seconds, milliseconds, and nanoseconds of the CMTime instance.
  var components: (hours: Int, minutes: Int, secs: Int, milliseconds: Int, nanosecs: Int) {
    (hours, minutes, secs, millisecs, nanosecs)
  }
}

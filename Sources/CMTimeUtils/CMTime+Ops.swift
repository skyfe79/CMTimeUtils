import CoreMedia

/// Adds two `CMTime` values and stores the result in the left-hand-side variable.
/// - Parameters:
///   - lhs: The left-hand-side value to add to.
///   - rhs: The right-hand-side value to add.
public func += (lhs: inout CMTime, rhs: CMTime) {
  lhs = CMTimeAdd(lhs, rhs)
}

/// Subtracts a `CMTime` value from another and stores the result in the left-hand-side variable.
/// - Parameters:
///   - lhs: The left-hand-side value to subtract from.
///   - rhs: The right-hand-side value to subtract.
public func -= (lhs: inout CMTime, rhs: CMTime) {
  lhs = CMTimeSubtract(lhs, rhs)
}

/// Multiplies a `CMTime` value by an `Int32` multiplier.
/// - Parameters:
///   - lhs: The `CMTime` value to multiply.
///   - multiplier: The `Int32` multiplier.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (lhs: CMTime, multiplier: Int32) -> CMTime {
  return CMTimeMultiply(lhs, multiplier: multiplier)
}

/// Multiplies a `CMTime` value by an `Int32` multiplier.
/// - Parameters:
///   - multiplier: The `Int32` multiplier.
///   - time: The `CMTime` value to multiply.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (multiplier: Int32, time: CMTime) -> CMTime {
  return CMTimeMultiply(time, multiplier: multiplier)
}

/// Multiplies a `CMTime` value by an `Int` multiplier.
/// - Parameters:
///   - multiplier: The `Int` multiplier.
///   - time: The `CMTime` value to multiply.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (multiplier: Int, time: CMTime) -> CMTime {
  return CMTimeMultiply(time, multiplier: Int32(multiplier))
}

/// Multiplies a `CMTime` value by an `Int` multiplier.
/// - Parameters:
///   - time: The `CMTime` value to multiply.
///   - multiplier: The `Int` multiplier.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (time: CMTime, multiplier: Int) -> CMTime {
  return CMTimeMultiply(time, multiplier: Int32(multiplier))
}

/// Multiplies a `CMTime` value by a `Float64` multiplier.
/// - Parameters:
///   - time: The `CMTime` value to multiply.
///   - multiplier: The `Float64` multiplier.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (time: CMTime, multiplier: Float64) -> CMTime {
  return CMTimeMultiplyByFloat64(time, multiplier: multiplier)
}

/// Multiplies a `CMTime` value by a `Float64` multiplier.
/// - Parameters:
///   - multiplier: The `Float64` multiplier.
///   - time: The `CMTime` value to multiply.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (multiplier: Float64, time: CMTime) -> CMTime {
  return CMTimeMultiplyByFloat64(time, multiplier: multiplier)
}

/// Multiplies a `CMTime` value by a `Float` multiplier.
/// - Parameters:
///   - time: The `CMTime` value to multiply.
///   - multiplier: The `Float` multiplier.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (time: CMTime, multiplier: Float) -> CMTime {
  return CMTimeMultiplyByFloat64(time, multiplier: Float64(multiplier))
}

/// Multiplies a `CMTime` value by a `Float` multiplier.
/// - Parameters:
///   - multiplier: The `Float` multiplier.
///   - time: The `CMTime` value to multiply.
/// - Returns: The result of the multiplication as a new `CMTime`.
public func * (multiplier: Float, time: CMTime) -> CMTime {
  return CMTimeMultiplyByFloat64(time, multiplier: Float64(multiplier))
}

/// Multiplies a `CMTime` value by an `Int` multiplier and stores the result in the left-hand-side variable.
/// - Parameters:
///   - lhs: The `CMTime` value to multiply.
///   - multiplier: The `Int` multiplier.
public func *= (lhs: inout CMTime, multiplier: Int) {
  lhs = lhs * multiplier
}

/// Multiplies a `CMTime` value by an `Int32` multiplier and stores the result in the left-hand-side variable.
/// - Parameters:
///   - lhs: The `CMTime` value to multiply.
///   - multiplier: The `Int32` multiplier.
public func *= (lhs: inout CMTime, multiplier: Int32) {
  lhs = lhs * multiplier
}

/// Multiplies a `CMTime` value by a `Float64` multiplier and stores the result in the left-hand-side variable.
/// - Parameters:
///   - lhs: The `CMTime` value to multiply.
///   - multiplier: The `Float64` multiplier.
public func *= (lhs: inout CMTime, multiplier: Float64) {
  lhs = lhs * multiplier
}

/// Multiplies a `CMTime` value by a `Float` multiplier and stores the result in the left-hand-side variable.
/// - Parameters:
///   - lhs: The `CMTime` value to multiply.
///   - multiplier: The `Float` multiplier.
public func *= (lhs: inout CMTime, multiplier: Float) {
  lhs = lhs * multiplier
}

/// Divides a `CMTime` value by an `Int32` divisor.
/// - Parameters:
///   - time: The `CMTime` value to divide.
///   - divisor: The `Int32` divisor.
/// - Returns: The result of the division as a new `CMTime`.
public func / (time: CMTime, divisor: Int32) -> CMTime {
  return CMTimeMultiplyByRatio(time, multiplier: 1, divisor: divisor)
}

/// Divides a `CMTime` value by an `Int32` divisor and stores the result in the left-hand-side variable.
/// - Parameters:
///   - lhs: The `CMTime` value to divide.
///   - divisor: The `Int32` divisor.
public func /= (lhs: inout CMTime, divisor: Int32) {
  lhs = lhs / divisor
}

/// Compares a `CMTime` value to a `Float64` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float64` value representing seconds.
/// - Returns: A Boolean value indicating whether the `CMTime` value is equal to the `Float64` value.
public func == (time: CMTime, seconds: Float64) -> Bool {
  return time == CMTime(seconds: seconds, preferredTimescale: time.timescale)
}

/// Compares a `CMTime` value to a `Float` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float` value representing seconds.
/// - Returns: A Boolean value indicating whether the `CMTime` value is equal to the `Float` value.
public func == (time: CMTime, seconds: Float) -> Bool {
  return time == Float64(seconds)
}

/// Compares a `Float64` value representing seconds to a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float64` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating whether the `Float64` value is equal to the `CMTime` value.
public func == (seconds: Float64, time: CMTime) -> Bool {
  return time == seconds
}

/// Compares a `Float` value representing seconds to a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating whether the `Float` value is equal to the `CMTime` value.
public func == (seconds: Float, time: CMTime) -> Bool {
  return time == seconds
}

/// Compares a `CMTime` value to a `Float64` value representing seconds for inequality.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float64` value representing seconds.
/// - Returns: A Boolean value indicating whether the `CMTime` value is not equal to the `Float64` value.
public func != (time: CMTime, seconds: Float64) -> Bool {
  return !(time == seconds)
}

/// Compares a `CMTime` value to a `Float` value representing seconds for inequality.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float` value representing seconds.
/// - Returns: A Boolean value indicating whether the `CMTime` value is not equal to the `Float` value.
public func != (time: CMTime, seconds: Float) -> Bool {
  return time != Float64(seconds)
}

/// Compares a `Float64` value representing seconds to a `CMTime` value for inequality.
/// - Parameters:
///   - seconds: The `Float64` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating whether the `Float64` value is not equal to the `CMTime` value.
public func != (seconds: Float64, time: CMTime) -> Bool {
  return time != seconds
}

/// Compares a `Float` value representing seconds to a `CMTime` value for inequality.
/// - Parameters:
///   - seconds: The `Float` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating whether the `Float` value is not equal to the `CMTime` value.
public func != (seconds: Float, time: CMTime) -> Bool {
  return time != seconds
}

/// Determines if a `CMTime` value is less than a `Float64` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float64` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is less than the `Float64` value.
public func < (time: CMTime, seconds: Float64) -> Bool {
  return time < CMTime(seconds: seconds, preferredTimescale: time.timescale)
}

/// Determines if a `CMTime` value is less than a `Float` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is less than the `Float` value.
public func < (time: CMTime, seconds: Float) -> Bool {
  return time < Float64(seconds)
}

/// Determines if a `CMTime` value is less than or equal to a `Float64` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float64` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is less than or equal to the `Float64` value.
public func <= (time: CMTime, seconds: Float64) -> Bool {
  return time < seconds || time == seconds
}

/// Determines if a `CMTime` value is less than or equal to a `Float` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is less than or equal to the `Float` value.
public func <= (time: CMTime, seconds: Float) -> Bool {
  return time < seconds || time == seconds
}

/// Determines if a `Float64` value representing seconds is less than a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float64` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float64` value is less than the `CMTime` value.
public func < (seconds: Float64, time: CMTime) -> Bool {
  return CMTime(seconds: seconds, preferredTimescale: time.timescale) < time
}

/// Determines if a `Float` value representing seconds is less than a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float` value is less than the `CMTime` value.
public func < (seconds: Float, time: CMTime) -> Bool {
  return Float64(seconds) < time
}

/// Determines if a `Float64` value representing seconds is less than or equal to a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float64` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float64` value is less than or equal to the `CMTime` value.
public func <= (seconds: Float64, time: CMTime) -> Bool {
  return seconds < time || seconds == time
}

/// Determines if a `Float` value representing seconds is less than or equal to a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float` value is less than or equal to the `CMTime` value.
public func <= (seconds: Float, time: CMTime) -> Bool {
  return seconds < time || seconds == time
}

/// Determines if a `CMTime` value is greater than a `Float64` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float64` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is greater than the `Float64` value.
public func > (time: CMTime, seconds: Float64) -> Bool {
  return time > CMTime(seconds: seconds, preferredTimescale: time.timescale)
}

/// Determines if a `CMTime` value is greater than a `Float` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is greater than the `Float` value.
public func > (time: CMTime, seconds: Float) -> Bool {
  return time > Float64(seconds)
}

/// Determines if a `CMTime` value is greater than or equal to a `Float64` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float64` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is greater than or equal to the `Float64` value.
public func >= (time: CMTime, seconds: Float64) -> Bool {
  return time > seconds || time == seconds
}

/// Determines if a `CMTime` value is greater than or equal to a `Float` value representing seconds.
/// - Parameters:
///   - time: The `CMTime` value.
///   - seconds: The `Float` value representing seconds.
/// - Returns: A Boolean value indicating if the `CMTime` value is greater than or equal to the `Float` value.
public func >= (time: CMTime, seconds: Float) -> Bool {
  return time > seconds || time == seconds
}

/// Determines if a `Float64` value representing seconds is greater than a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float64` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float64` value is greater than the `CMTime` value.
public func > (seconds: Float64, time: CMTime) -> Bool {
  return CMTime(seconds: seconds, preferredTimescale: time.timescale) > time
}

/// Determines if a `Float` value representing seconds is greater than a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float` value is greater than the `CMTime` value.
public func > (seconds: Float, time: CMTime) -> Bool {
  return Float64(seconds) > time
}

/// Determines if a `Float64` value representing seconds is greater than or equal to a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float64` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float64` value is greater than or equal to the `CMTime` value.
public func >= (seconds: Float64, time: CMTime) -> Bool {
  return seconds > time || seconds == time
}

/// Determines if a `Float` value representing seconds is greater than or equal to a `CMTime` value.
/// - Parameters:
///   - seconds: The `Float` value representing seconds.
///   - time: The `CMTime` value.
/// - Returns: A Boolean value indicating if the `Float` value is greater than or equal to the `CMTime` value.
public func >= (seconds: Float, time: CMTime) -> Bool {
  return seconds > time || seconds == time
}

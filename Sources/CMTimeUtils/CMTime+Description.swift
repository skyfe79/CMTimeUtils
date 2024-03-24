import CoreMedia
import Foundation

/// Provides a textual representation of a `CMTime`.
extension CMTime: CustomStringConvertible, CustomDebugStringConvertible {
  public var description: String {
    return "\(CMTimeGetSeconds(self))"
  }

  public var debugDescription: String {
    return String(describing: CMTimeCopyDescription(allocator: nil, time: self))
  }
}

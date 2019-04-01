import Foundation

@objc(RNEventEmitter)
open class RNEventEmitter: RCTEventEmitter {
  @objc open override func supportedEvents() -> [String] {
    return ["PushNotification"]
  }
  
  @objc open override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

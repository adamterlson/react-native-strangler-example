import Foundation

@objc(RNEventEmitter)
open class RNEventEmitter: RCTEventEmitter {
  override init() {
    super.init()
    Facade.sharedInstance.rnEmitter = self
  }
  
  @objc open override func supportedEvents() -> [String] {
    return ["PushNotification"]
  }
  
  @objc open override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

import Foundation

@objc(RNEventEmitter)
open class RNEventEmitter: RCTEventEmitter {
  
  override init() {
    super.init()
    
  }
  
  @objc open override func supportedEvents() -> [String] {
    return ["PushNotification"]
  }
  
}

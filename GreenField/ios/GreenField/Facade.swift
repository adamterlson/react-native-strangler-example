//
//  LaunchGreenFIeld.swift
//  GreenField
//
//  Created by marcus.oesterberg on 12.03.19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit

class Facade: NSObject {
  static let sharedInstance = Facade()
  
  public var window: UIWindow!
  public var rnEmitter: RNEventEmitter!
  public var canDoLaunch = false
  public var canDoMessages = true

  override init() {
    self.window = nil
    self.rnEmitter = nil
    super.init()
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.onDidLaunch(notification:)), name: Notification.Name("DidLaunch"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.onButtonPress(notification:)), name: Notification.Name("ButtonPress"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.onPushNotification(notification:)), name: Notification.Name("PushNotification"), object: nil)
  }

  func launchRN(props: Dictionary<String, String>) {
      let jsCodeLocation  = RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
  
      let rootViewController = UIViewController()
      rootViewController.view = RCTRootView(
          bundleURL: jsCodeLocation,
          moduleName: "GreenField",
          initialProperties: props
      )
  
      self.window.rootViewController = rootViewController
      self.window.makeKeyAndVisible()
  }
  
  @objc
  func onDidLaunch(notification: Notification) {
    guard let legacyCallback = notification.object as? () -> () else {
      let object = notification.object as Any
      assertionFailure("Invalid callback: \(object)")
      return
    }
    
    if !canDoLaunch {
      legacyCallback()
      return
    }
    
    let props = ["initialRoute": "Home"]
    launchRN(props: props)
  }
  
  @objc
  func onButtonPress(notification: Notification) {
    guard let legacyCallback = notification.object as? () -> () else {
      let object = notification.object as Any
      assertionFailure("Invalid callback: \(object)")
      return
    }
    
    if !canDoMessages {
      legacyCallback()
      return
    }
    
    let props = ["initialRoute": "Messages"]
    launchRN(props: props)
  }
  
  @objc
  func onPushNotification(notification: Notification) {
    if (rnEmitter != nil) {
      rnEmitter.sendEvent(withName: "PushNotification", body: [
        "number": 123.9,
        "string": "foo",
        "boolean": true,
        "array": [1, 22.2, "33"],
        "object": ["a": 1, "b": 2]
      ])
    }
  }
}

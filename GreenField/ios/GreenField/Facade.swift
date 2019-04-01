//
//  LaunchGreenFIeld.swift
//  GreenField
//
//  Created by marcus.oesterberg on 12.03.19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit

class Facade: NSObject {
  var window: UIWindow
  
  public var canDoLaunch = false
  public var canDoMessages = true

  init(_ window: UIWindow) {
    self.window = window
    super.init()
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.onDidLaunch(notification:)), name: Notification.Name("DidLaunch"), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.onButtonPress(notification:)), name: Notification.Name("ButtonPress"), object: nil)
  }
  
  // deinit--cleanup

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
  
}

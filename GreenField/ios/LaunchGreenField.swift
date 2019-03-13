//
//  LaunchGreenFIeld.swift
//  GreenField
//
//  Created by marcus.oesterberg on 12.03.19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit

class LaunchGreenField: NSObject {
  var window: UIWindow

  init(_ window: UIWindow) {
    self.window = window
    super.init()
    NotificationCenter.default.addObserver(self, selector: #selector(self.onReceive(notification:)), name: Notification.Name("GreenField"), object: nil)
  }

  public func launch() {
      // Ah, the greenfield...
      let jsCodeLocation  = RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
  
      let props = ["pushNotificationRecevied": "YES"]
  
      let rootViewController = UIViewController()
      rootViewController.view = RCTRootView(
          bundleURL: jsCodeLocation,
          moduleName: "GreenField",
          initialProperties: props
      )
  
      self.window.rootViewController = rootViewController
      self.window.makeKeyAndVisible()
  }
  
  @objc func onReceive(notification: Notification) {
    guard let callback = notification.object as? () -> () else {
      let object = notification.object as Any
      assertionFailure("Invalid object: \(object)")
      return
    }
    
    if Facade.isAppUser() {
        launch()
    } else {
        callback()
    }
  }
  
}

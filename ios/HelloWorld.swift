//
//  HelloWorld.swift
//  react_native_nativeCode
//
//  Created by seijiro on 2019/04/12.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import UIKit

@objc(HelloWorld)
class HelloWorld: NSObject {

  @objc(say)
  func say() {
    print("Hello World")
    let alert = UIAlertController(title: "Titttl" , message: "Hello World", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
      appDelegate.window.rootViewController?.present(alert, animated: true, completion: nil)
    }


  }

}

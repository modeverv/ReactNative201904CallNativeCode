//
//  TwitterModule.swift
//  react_native_nativeCode
//
//  Created by seijiro on 2019/04/12.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import TwitterKit

@objc(TwitterModule)
class TwitterModule: NSObject {
  @objc(auth:reject:)
  func auth(resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
      if let session = session {
        resolve([
          "token": session.authToken,
          "secret": session.authTokenSecret,
          "id": session.userID,
          "name": session.userName,
          ])
      } else {
        reject(nil, nil, error)
      }
    })
  }

  @objc(tweet)
  func tweet() {
    guard let vc = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController else { return }
    let composer = TWTRComposer()
    composer.setText("just setting up my Twitter Kit")
    composer.show(from: vc, completion: {(result) in
      if (result == .done) {
        print("Successfully composed Tweet")
      } else {
        print("Cancelled composing")
      }
    })
  }

  @objc(isLogined:reject:)
  func isLogined(resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
    resolve(TWTRTwitter.sharedInstance().sessionStore.existingUserSessions().count > 0)
  }

  @objc(getTimeline:reject:)
  func getTimeline(resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    let client = TWTRAPIClient.withCurrentUser()
    let endpoint = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    let request = client.urlRequest(withMethod: "GET", urlString: endpoint, parameters: nil, error: nil)
    client.sendTwitterRequest(request, completion: {(response,data, e) in
      if let e = e {
        print(e);
        return
      }
      do {
        let json = try JSONSerialization.jsonObject(with: data!, options: [])
        resolve(json)
      } catch {
        resolve([])
      }
    })
  }
}

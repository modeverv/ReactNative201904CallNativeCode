//
//  Bridge.m
//  react_native_nativeCode
//
//  Created by seijiro on 2019/04/12.
//  Copyright © 2019 Facebook. All rights reserved.
//


#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(HelloWorld, NSObject)

RCT_EXTERN_METHOD(say)

@end


@interface RCT_EXTERN_MODULE(TwitterModule, NSObject)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXTERN_METHOD(auth:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject )

RCT_EXTERN_METHOD(tweet)

RCT_EXTERN_METHOD(isLogined:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject )

RCT_EXTERN_METHOD(getTimeline:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject )

@end

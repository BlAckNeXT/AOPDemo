//
//  AppDelegate+Logging.m
//  AOPDemo
//
//  Created by JasonJ on 15/6/16.
//  Copyright (c) 2015年 Sysw1n. All rights reserved.
//

#import "AppDelegate+Logging.h"
#import "TNLogging.h"
#import "TNLog.h"

@implementation AppDelegate (Logging)

/**
 *  设置日志策略
 */
- (void)setupLogging
{
    NSDictionary *config = @{
                             @"ViewController": @{
                                     TNLoggingPageImpression: @"page imp - ViewController",
                                     TNLoggingTrackedEvents: @[
                                             @{
                                                 TNLoggingEventName: @"button one clicked",
                                                 TNLoggingEventSelectorName: @"buttonOneClicked:",
                                                 TNLoggingEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"button one clicked");
                                                 },
                                                 },
                                             @{
                                                 TNLoggingEventName: @"button two clicked",
                                                 TNLoggingEventSelectorName: @"buttonTwoClicked:",
                                                 TNLoggingEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"button two clicked");
                                                 },
                                                 },
                                             @{
                                                 TNLoggingEventName: @"test test!!!",
                                                 TNLoggingEventSelectorName: @"testAOP",
                                                 TNLoggingEventHandlerBlock: ^(id<AspectInfo> aspectInfo) {
                                                     NSLog(@"我是张雪剑思密达");
                                                 },
                                                 },
                                             ],
                                     },
                             
                             @"SecondViewController": @{
                                     TNLoggingPageImpression: @"page imp - SecondViewController",
                                     }
                             
                             };
    
    [TNLogging setupWithConfiguration:config];
}



@end

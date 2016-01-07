//
//  TNLogging.h
//  AOPDemo
//
//  Created by JasonJ on 15/6/16.
//  Copyright (c) 2015年 Sysw1n. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Aspects.h>

#define TNLoggingPageImpression @"TNLoggingPageImpression"
#define TNLoggingTrackedEvents @"TNLoggingTrackedEvents"
#define TNLoggingEventName @"TNLoggingEventName"
#define TNLoggingEventSelectorName @"TNLoggingEventSelectorName"
#define TNLoggingEventHandlerBlock @"TNLoggingEventHandlerBlock"

@interface TNLogging : NSObject

/**
 *  配置策略
 *
 *  @param configs 策略字典
 */
+ (void)setupWithConfiguration:(NSDictionary *)configs;

@end

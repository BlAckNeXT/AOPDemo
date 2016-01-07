//
//  TNLogging.m
//  AOPDemo
//
//  Created by JasonJ on 15/6/16.
//  Copyright (c) 2015年 Sysw1n. All rights reserved.
//

#import "TNLogging.h"
#import <UIKit/UIKit.h>

@implementation TNLogging

typedef void (^AspectHandlerBlock)(id<AspectInfo> aspectInfo);


/**
 *  配置策略
 *
 *  @param configs 策略字典
 */
+ (void)setupWithConfiguration:(NSDictionary *)configs
{
    // Hook Page Impression
    [UIViewController aspect_hookSelector:@selector(viewDidAppear:)
                              withOptions:AspectPositionAfter
                               usingBlock:^(id<AspectInfo> aspectInfo) {
                                   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                       NSString *className = NSStringFromClass([[aspectInfo instance] class]);
                                       NSString *pageImp = configs[className][TNLoggingPageImpression];
                                       if (pageImp) {
                                           NSLog(@"%@", pageImp);
                                       }
                                   });
                               } error:NULL];
    
    // Hook Events
    for (NSString *className in configs) {
        Class clazz = NSClassFromString(className);
        NSDictionary *config = configs[className];
        
        if (config[TNLoggingTrackedEvents]) {
            for (NSDictionary *event in config[TNLoggingTrackedEvents]) {
                SEL selekor = NSSelectorFromString(event[TNLoggingEventSelectorName]);
                AspectHandlerBlock block = event[TNLoggingEventHandlerBlock];
                
                // Before
//                [clazz aspect_hookSelector:selekor
//                               withOptions:AspectPositionBefore
//                                usingBlock:^(id<AspectInfo> aspectInfo) {
//                                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                                        block(aspectInfo);
//                                    });
//                                } error:NULL];
                
                // After
                [clazz aspect_hookSelector:selekor
                               withOptions:AspectPositionAfter
                                usingBlock:^(id<AspectInfo> aspectInfo) {
                                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                        block(aspectInfo);
                                    });
                                } error:NULL];
                
            }
        }
    }
}


@end

//
//  CalendarManager.h
//  DentistAssist
//
//  Created by NillCui on 15/5/20.
//  Copyright (c) 2015年 NillCui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarManager : NSObject

+ (instancetype)sharedInstance;

- (void)requestCalendarAccess:(void (^)())success;
- (BOOL)isAuthSuccess;
- (BOOL)isAuthDenied;

- (BOOL)addEvent:(NSString *)title notes:(NSString *)notes startTime:(NSDate *)startTime;

@end

//
//  CalendarManager.m
//  DentistAssist
//
//  Created by NillCui on 15/5/20.
//  Copyright (c) 2015年 NillCui. All rights reserved.
//

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "CalendarManager.h"

@interface CalendarManager ()

// EKEventStore instance associated with the current Calendar application
@property (nonatomic, strong) EKEventStore *eventStore;

// Default calendar associated with the above event store
@property (nonatomic, strong) EKCalendar *defaultCalendar;

@end

@implementation CalendarManager

+ (instancetype)sharedInstance
{
    static CalendarManager * _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc]init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        // Initialize the event store
        self.eventStore = [[EKEventStore alloc] init];
    }
    return self;
}

- (BOOL)isAuthSuccess
{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    return status == EKAuthorizationStatusAuthorized;
}
- (BOOL)isAuthDenied
{
    BOOL ret = NO;
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    switch (status)
    {
        case EKAuthorizationStatusAuthorized:
        case EKAuthorizationStatusNotDetermined:
            break;
        case EKAuthorizationStatusDenied:
        case EKAuthorizationStatusRestricted:
            ret = YES;
            break;
        default:
            break;
    }
    return ret;
}

// Prompt the user for access to their Calendar
- (void)requestCalendarAccess:(void (^)())success
{
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
             // Let's ensure that our code will be executed from the main queue
             dispatch_async(dispatch_get_main_queue(), ^{
                 success();
             });
         }
     }];
}


- (BOOL)addEvent:(NSString *)title notes:(NSString *)notes startTime:(NSDate *)startTime
{
    EKEvent *event = [EKEvent eventWithEventStore:self.eventStore];
    
    // set event's properties
    [event setTitle:title];
    [event setNotes:notes];
    [event setStartDate: startTime];
    [event setEndDate: startTime];
//    [event setAllDay: YES];
    
    EKCalendar *calendar = [self.eventStore defaultCalendarForNewEvents];
    [event setCalendar: calendar];
    NSError *err = nil;
    [self.eventStore saveEvent:event span:EKSpanThisEvent error:&err];
    
    if (err == nil) {
        return YES;
    } else {
        return NO;
    }
}

@end

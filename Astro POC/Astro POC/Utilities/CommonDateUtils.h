//
//  CommonDateUtils.h
//  IntercorpWorkerApp
//
//  Created by Kevin Bernard R. San Gaspar on 9/24/15.
//  Copyright (c) 2015 Kevin Bernard San Gaspar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonDateUtils : NSObject

+ (NSString*) stringFromDate: (NSDate*) date;

+ (NSDate*) date: (NSDate*)   date
            plus: (NSInteger) minutes;

+ (NSDate*) date: (NSDate*)   date
        plusDays: (NSInteger) days;

+ (NSDate*) dateFromTimestamp: (NSNumber*) timestamp;

+ (NSDate*) dateFromJSON: (NSString*) dateString;

+ (NSString*) jsonStringFromDate: (NSDate*) date;


@end

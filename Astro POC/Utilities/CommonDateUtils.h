//
//  CommonDateUtils.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
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

//
//  DateUtils.h
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/9/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

/* Retruns date by parsing string with format 'yyyy-MM-dd'T'HH:mm:ssZ' */
+ (NSDate*) dateFromString: (NSString*) dateString;

/* Retruns string by formatting date with format 'yyyy-MM-dd'T'HH:mm:ssZ' */
+ (NSString*) stringFromDate: (NSDate*) date;

/* Retruns date by parsing string with format 'dd-MM-yyyy' */
+ (NSDate*) dateFromDayString: (NSString*) dateString;

/* Retruns string by formatting date with format 'dd-MM-yyyy'*/
+ (NSString*) stringFromDayDate: (NSDate*) date;

/* Retruns midnight date tomorrow */
+ (NSDate*) nextMidnight: (NSDate*) date;

/* Retruns midnight date today */
+ (NSDate*) beforeMidnight: (NSDate*) date;

/* Retruns array of string days of format 'dd-MM-yyyy' 
  between fromDate and toDate */
+ (NSArray*) stringDayDatesFromDate: (NSDate*) fromDate
                             toDate: (NSDate*) toDate;

/* Retruns number of days between dates */
+ (NSInteger) numberOfDaysFromDate: (NSDate*) fromDate
                            toDate: (NSDate*) toDate;

/* Retruns date of by adding days */
+ (NSDate*) dateByAddingDays: (NSInteger) days
                      toDate: (NSDate*)   date;

/* Retruns date of by adding mins */
+ (NSDate*) dateByAddingMinutes: (NSInteger) minutes
                         toDate: (NSDate*)   date;

/* Retruns date of by adding secs */
+ (NSDate*) dateByAddingSeconds: (NSInteger) seconds
                         toDate: (NSDate*)   date;

+ (NSString*) dayNameFromDate: (NSDate*) date;

/* Check is in between date */
+ (BOOL)  date: (NSDate*) date
 isBetweenDate: (NSDate*) beginDate
       andDate: (NSDate*) endDate;

/* Return notificaiton time */

+ (NSString *) getNotificationTime: (NSDate *)date;

/* Return notification Date */

+ (NSString *) getNotificationDate: (NSDate *) date;

/* Get timeinterval since 1970 */

+ (NSString*) stringFromDateAndTimeTwelveHoursFormat: (NSDate*) date;


@end

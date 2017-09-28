//
//  DateUtils.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "DateUtils.h"

static NSDateFormatter* sm_fullFormatter;
static NSDateFormatter* sm_dayFormatter;
static NSDateFormatter* sm_dayNameFormatter;
static NSLocale* sm_twelveHourLocale;

@implementation DateUtils

#pragma mark - Static

+ (NSDate*) dateFromString: (NSString*) dateString
{
  NSDateFormatter* formatter = [[self class] _fullFormatter];
  formatter.locale = [self _twelveHourLocale];
  return [formatter dateFromString: dateString];
}

+ (NSString*) stringFromDate: (NSDate*) date
{
  NSDateFormatter* formatter = [[self class] _fullFormatter];
  formatter.locale = [self _twelveHourLocale];
  return [[formatter stringFromDate: date] uppercaseString];
}

+ (NSDate*) dateFromDayString: (NSString*) dateString
{
  NSDateFormatter* formatter = [[self class] _dayFormatter];
  formatter.locale = [self _twelveHourLocale];
  return [formatter dateFromString: dateString];
}

+ (NSString*) stringFromDayDate: (NSDate*) date
{
  NSDateFormatter* formatter = [[self class] _dayFormatter];
  formatter.locale = [self _twelveHourLocale];
  return [[formatter stringFromDate: date] uppercaseString];
}

+ (NSDate*) nextMidnight: (NSDate*) date
{
  NSCalendar* cal = [NSCalendar currentCalendar];
  NSDateComponents* dateComps = [cal components: NSCalendarUnitDay   |
                                                 NSCalendarUnitMonth |
                                                 NSCalendarUnitYear
                                       fromDate: date];
  NSDate* newDate = [cal dateFromComponents: dateComps];
  NSDateComponents* addComps = [[NSDateComponents alloc] init];
  addComps.day = 1;
  
  newDate = [cal dateByAddingComponents: addComps
                                 toDate: newDate
                                options: 0];
  return newDate;
}

+ (NSDate*) beforeMidnight: (NSDate*) date
{
  NSDate* nextMidNight = [self nextMidnight: date];
  return [self dateByAddingSeconds: -1
                            toDate: nextMidNight];
}

+ (NSArray*) stringDayDatesFromDate: (NSDate*) fromDate
                             toDate: (NSDate*) toDate
{
  NSMutableArray* stringDates = [NSMutableArray new];
  NSCalendar* cal = [NSCalendar currentCalendar];
  NSDateComponents* endDateComps = [cal components: NSCalendarUnitDay   |
                                                    NSCalendarUnitMonth |
                                                    NSCalendarUnitYear
                                          fromDate: toDate];
  NSDate* endDate = [cal dateFromComponents: endDateComps];
  NSDateComponents* currDateComps = [cal components: NSCalendarUnitDay   |
                                                     NSCalendarUnitMonth |
                                                     NSCalendarUnitYear
                                           fromDate: fromDate];
  NSDate* currentDate = [cal dateFromComponents: currDateComps];
  
  while(   [currentDate compare: endDate] == NSOrderedAscending
        || [currentDate compare: endDate] == NSOrderedSame)
  {
    [stringDates addObject: [self stringFromDayDate: currentDate]];
    currDateComps.day += 1;
    currentDate = [cal dateFromComponents: currDateComps];
  }
  return stringDates;
}

+ (NSInteger) numberOfDaysFromDate: (NSDate*) fromDate
                            toDate: (NSDate*) toDate
{
  NSCalendar* cal = [NSCalendar currentCalendar];
  
  NSDateComponents* comps = [cal components: NSCalendarUnitDay
                                   fromDate: fromDate
                                     toDate: toDate
                                    options: 0];
  return comps.day;
}

+ (NSDate*) dateByAddingDays: (NSInteger) days
                      toDate: (NSDate*)   date
{
  NSCalendar* cal = [NSCalendar currentCalendar];
  NSDateComponents* comps = [NSDateComponents new];
  comps.day = days;
  
  return [cal dateByAddingComponents: comps
                              toDate: date
                             options: 0];
}

+ (NSDate*) dateByAddingMinutes: (NSInteger) minutes
                         toDate: (NSDate*)   date
{
  NSCalendar* cal = [NSCalendar currentCalendar];
  NSDateComponents* comps = [NSDateComponents new];
  comps.minute = minutes;
  
  return [cal dateByAddingComponents: comps
                              toDate: date
                             options: 0];
}

+ (NSDate*) dateByAddingSeconds: (NSInteger) seconds
                         toDate: (NSDate*)   date
{
  NSCalendar* cal = [NSCalendar currentCalendar];
  NSDateComponents* comps = [NSDateComponents new];
  comps.second = seconds;
  
  return [cal dateByAddingComponents: comps
                              toDate: date
                             options: 0];
}


+ (NSString*) dayNameFromDate: (NSDate*) date
{
  NSDateFormatter* formatter = [[self class] _dayNameFormatter];
  return [formatter stringFromDate: date];
}

+ (BOOL)  date: (NSDate*) date
 isBetweenDate: (NSDate*) beginDate
       andDate: (NSDate*) endDate
{
  BOOL isBetween = YES;
  
  if ([date compare: beginDate] == NSOrderedAscending)
  {
    isBetween = NO;
  }
  
  if ([date compare: endDate] == NSOrderedDescending)
  {
    isBetween = NO;
  }
  
  return isBetween;
}

#pragma mark - Utility

+ (NSDateFormatter*) _fullFormatter
{
  if (sm_fullFormatter == nil)
  {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sm_fullFormatter = [NSDateFormatter new];
      sm_fullFormatter.locale = [[self class] _twelveHourLocale];
      sm_fullFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss a";
    });
  }
  return sm_fullFormatter;
}

+ (NSDateFormatter*) _dayFormatter
{
  if (sm_dayFormatter == nil)
  {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sm_dayFormatter = [NSDateFormatter new];
      sm_dayFormatter.dateFormat = @"dd-MMM-yyyy";
    });
  }
  return sm_dayFormatter;
}

+ (NSDateFormatter*) _dayNameFormatter
{
  if (sm_dayNameFormatter == nil)
  {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sm_dayNameFormatter = [NSDateFormatter new];
      sm_dayNameFormatter.dateFormat = @"EEEE";
    });
  }
  return sm_dayNameFormatter;
}

+ (NSLocale*) _twelveHourLocale
{
  if (sm_twelveHourLocale == nil)
  {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sm_twelveHourLocale
        = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    });
  }
  return sm_twelveHourLocale;
}

+ (NSString *) getNotificationTime: (NSDate *) date
{
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"hh:mm a" options:0 locale:[NSLocale currentLocale]]];
  NSString *currentTime = [formatter stringFromDate:date];
  return currentTime;
}

+ (NSString *) getNotificationDate: (NSDate *) date
{
  NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
  
  [dateFormat1 setDateFormat:@"MMMM d-yyyy"];
  
  NSString *todayDate = [dateFormat1  stringFromDate:date];
  
  return todayDate;
}

+ (NSString*) stringFromDateAndTimeTwelveHoursFormat: (NSDate*) date
{
  NSDateFormatter* formatter = [NSDateFormatter new];
  formatter.locale = [[self class] _twelveHourLocale];
  formatter.dateFormat = @"MM-dd-yyyy HH:mm:ss";
  return [[formatter stringFromDate: date] uppercaseString];
}


@end

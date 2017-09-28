//
//  CommonDateUtils.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "CommonDateUtils.h"

@implementation CommonDateUtils

+ (NSString*) stringFromDate: (NSDate*) date
{
  NSDateFormatter* df = [[NSDateFormatter alloc] init];
  [df setDateFormat: @"dd/MM/yyyy"];
  return [df stringFromDate: date];
}

+ (NSDate*) date: (NSDate*)   date
            plus: (NSInteger) minutes
{
  NSDate* newDate = nil;
  
  if (date != nil)
  {
    NSDateComponents* dateComponents = [NSDateComponents new];
    [dateComponents setMinute: minutes];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    newDate = [calendar dateByAddingComponents: dateComponents
                                        toDate: date
                                       options: 0];
  }
  
  return newDate;
}

+ (NSDate*) date: (NSDate*)   date
        plusDays: (NSInteger) days
{
  NSDate* newDate = nil;
  
  if (date != nil)
  {
    NSDateComponents* dateComponents = [NSDateComponents new];
    [dateComponents setDay: days];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    newDate = [calendar dateByAddingComponents: dateComponents
                                        toDate: date
                                       options: 0];
  }
  
  return newDate;
}

+ (NSDate*) dateFromTimestamp: (NSNumber*) timestamp
{
  NSDate* date = nil;
  
  if (timestamp != nil)
  {
    date
      = [NSDate dateWithTimeIntervalSince1970:
          timestamp.integerValue];
  }
  return date;
}

+ (NSDate*) dateFromJSON: (NSString*) dateString
{
  // Expect date in this format "/Date(1268123281843)/"
  NSInteger startPos = [dateString rangeOfString:@"("].location+1;
  NSInteger endPos = [dateString rangeOfString:@")"].location;
  NSRange range = NSMakeRange(startPos,endPos-startPos);
  
  NSString* dateSubstring = [dateString substringWithRange: range];
  NSArray* numbers
    = [dateSubstring componentsSeparatedByCharactersInSet:
        [NSCharacterSet characterSetWithCharactersInString: @"+-"]];
  unsigned long long seconds = [numbers.firstObject longLongValue];
  NSTimeInterval interval = seconds/1000;
  return [NSDate dateWithTimeIntervalSince1970: interval];
}

+ (NSString*) jsonStringFromDate: (NSDate*) date
{
  return [NSString stringWithFormat: @"/Date(%lld)/",
            (long long) date.timeIntervalSince1970 * 1000];
}


@end

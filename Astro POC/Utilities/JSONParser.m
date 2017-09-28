//
//  JSONParser.m
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "JSONParser.h"
#import "CommonNumberUtil.h"
#import "CommonDateUtils.h"
#import "NSData+Base64.h"
#import "DateUtils.h"

@implementation JSONParser
{
  NSDictionary* _jsonDict;
}

- (instancetype) initWithJSONDict: (NSDictionary*) jsonDict
{
  if (self = [super init])
  {
    _jsonDict = jsonDict;
  }
  return self;
}

- (NSInteger) intForKey: (NSString*) key
{
  return [CommonNumberUtil intForValue: _jsonDict[key]];
}

- (long) longForKey: (NSString*) key
{
  return [CommonNumberUtil longForValue: _jsonDict[key]];
}

- (float) floatForKey: (NSString*) key
{
  return [CommonNumberUtil floatForValue: _jsonDict[key]];
}

- (double) doubleForKey: (NSString*) key
{
  return [CommonNumberUtil doubleForValue: _jsonDict[key]];
}

- (NSDate*) dateForKey: (NSString*) key
{
  NSObject* valueObject = _jsonDict[key];
  NSDate* dateValue = [NSDate dateWithTimeIntervalSince1970: 0];
  
  if ([valueObject isKindOfClass: [NSString class]])
  {
    dateValue = [DateUtils dateFromString: (NSString*) valueObject];
    dateValue = dateValue != nil ? dateValue : [NSDate distantPast];
  }
  
  return dateValue;
}

- (NSData*) imageDataForKey: (NSString*) key
{
  NSObject* valueObject = _jsonDict[key];
  NSData* imageData = [NSData data];
  
  if ([valueObject isKindOfClass: [NSString class]])
  {
    NSString* stringVal = (NSString*) valueObject;
    
    if(stringVal.length > 0)
    {
      imageData = [NSData dataFromBase64String: stringVal];
    }
  }
  
  return imageData;
}

- (NSString*) stringForKey: (NSString*) key
{
  id valueObject = _jsonDict[key];
  NSString* stringVal = @"";
  
  if ([valueObject isKindOfClass: NSString.class])
  {
    stringVal = valueObject;
    
    stringVal = [stringVal stringByReplacingOccurrencesOfString: @"\\n"
                                                     withString: @""];
    
    stringVal = [stringVal stringByReplacingOccurrencesOfString: @"U+005C"
                                                     withString: @"\\"];
    
    stringVal = [stringVal stringByReplacingOccurrencesOfString: @"&#8217"
                                                     withString: @"'"];
  
  }
  else if ([valueObject isKindOfClass: NSNumber.class])
  {
    stringVal = [NSString stringWithFormat: @"%@", valueObject];
  }
  
  return stringVal;
}

- (NSArray*) arrayForKey: (NSString*) key
{
  id valueObject = _jsonDict[key];
  NSArray* array = @[];
  
  if ( valueObject != nil &&
      [valueObject isKindOfClass: [NSArray class]])
  {
    array = valueObject;
  }
  return array;
}

- (bool) boolForKey: (NSString*) key
{
  id valueObject = _jsonDict[key];
  bool value = NO;
  
  if ( valueObject != nil &&
      [valueObject isKindOfClass: NSString.class])
  {
    NSString* stringVal = valueObject;
    value = ([stringVal.lowercaseString isEqualToString: @"y"]
             || [stringVal.lowercaseString isEqualToString: @"1"]);
  }
  else if ( valueObject != nil &&
           [valueObject isKindOfClass: NSNumber.class])
  {
    NSNumber* numVal = valueObject;
    value = numVal.boolValue;
  }
  
  return value;
}

@end

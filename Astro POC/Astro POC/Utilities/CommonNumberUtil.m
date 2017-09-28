//
//  CommonNumberUtil.m
//  IntercorpWorkerApp
//
//  Created by Kevin Bernard R. San Gaspar on 10/6/15.
//  Copyright © 2015 Kevin Bernard San Gaspar. All rights reserved.
//

#import "CommonNumberUtil.h"

@implementation CommonNumberUtil

+ (NSInteger) intForValue: (id) value
{
  NSNumber* numberVal = @(-1);
  
  if (value != nil
      && value != (id)[NSNull null])
  {
    numberVal = value;
  }
  
  return numberVal.integerValue;
}

+ (long long) longForValue: (id) value
{
  NSNumber* numberVal = @(-1);
  
  if (value != nil
      && value != (id)[NSNull null])
  {
    numberVal = value;
  }
  
  return numberVal.longLongValue;
}

+ (double) doubleForValue: (id) value
{
  NSNumber* numberVal = @(-1);
  
  if (value != nil
      && value != (id)[NSNull null])
  {
    numberVal = value;
  }
  
  return numberVal.doubleValue;
}

+ (float) floatForValue: (id) value
{
  NSNumber* numberVal = @(-1);
  
  if (value != nil
      && value != (id)[NSNull null])
  {
    if (![value isEqualToString: @""])
    {
        numberVal = value;
    }
  }

  return numberVal.floatValue;
}

@end

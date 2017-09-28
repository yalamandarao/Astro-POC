//
//  CommonNumberUtil.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
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

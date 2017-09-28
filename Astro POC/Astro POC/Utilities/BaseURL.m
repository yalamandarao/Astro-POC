//
//  BaseURL.m
//  Zimmer Sports
//
//  Created by Yalamandarao on 09/09/17.
//  Copyright © 2017 Nano Equipment Pte Ltd. All rights reserved.
//

#import "BaseURL.h"

@implementation BaseURL

+ (NSURL *) getBaseURL {
  NSBundle* mainBundle = [NSBundle mainBundle];
  
  NSString *path = [mainBundle pathForResource: @"Configurations"
                                        ofType: @"plist"];
  NSDictionary* configurations = [NSDictionary dictionaryWithContentsOfFile: path];
  
#ifdef DEBUG
  
  // Something to log your sensitive data here
  NSString* baseURLString = [[configurations valueForKey:@"Debug"] valueForKey:@"APIBaseURL"];
#else
  
  NSString* baseURLString = [[configurations valueForKey:@"Release"] valueForKey:@"APIBaseURL"];
  
#endif
  
  NSURL* baseURL = [NSURL URLWithString: baseURLString];
  
  return baseURL;
}

@end

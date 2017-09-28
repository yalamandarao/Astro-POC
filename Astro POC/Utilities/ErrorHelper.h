//
//  ErrorHelper.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  ZSUnknownError = 90000,
  ZSNetworkError = 90001,
  ZSLoginInvalidUsernamePasswordError = 90002,
  ZSLoginTimeoutError = 90003,
  ZSLoginInternetConnectionError = 90004,
  ZSServerkError = 90005,
  ZSCalendarPermissionError = 90006,
  ZSCalendarDownloadError = 90007,
  ZSNoLocalCalendarError = 90008,
  ZSNoDataError = 90009,
  ZSErrorDomainError = 1
} ZSErrors;

@interface ErrorHelper : NSObject

+ (NSError*) usernamePasswordErrorWithDomain: (NSString*)     domain
                                    userInfo: (NSDictionary*) userInfo;

+ (NSError*) loginTimeoutError: (NSString*)     domain
                      userInfo: (NSDictionary*) userInfo;

+ (NSError*) serverError: (NSString*)     domain
                userInfo: (NSDictionary*) userInfo;


+ (NSError*) calendarPermissionError: (NSString*)     domain
                            userInfo: (NSDictionary*) userInfo;

+ (NSError*) calendarDownloadError: (NSString*)     domain
                          userInfo: (NSDictionary*) userInfo;

+ (NSError*) internetConnectionErrorWithDomain:(NSString*)      domain
                                      userInfo: (NSDictionary*) userInfo;

+ (NSError*) noLocalCalendarError: (NSString*)     domain
                         userInfo: (NSDictionary*) userInfo;

+ (NSError*) noDataError: (NSString*)     domain
                userInfo: (NSDictionary*) userInfo;

+ (NSError*) unknownError: (NSString*)     domain
                 userInfo: (NSDictionary*) userInfo;

@end

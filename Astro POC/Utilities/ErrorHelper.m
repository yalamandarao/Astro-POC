//
//  ErrorHelper.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "ErrorHelper.h"

@implementation ErrorHelper

+ (NSError*) usernamePasswordErrorWithDomain: (NSString*)     domain
                                    userInfo: (NSDictionary*) userInfo
{
  return
    [NSError errorWithDomain: domain
                        code: ZSLoginInvalidUsernamePasswordError
                    userInfo: userInfo];
}

+ (NSError*) internetConnectionErrorWithDomain:(NSString*)      domain
                                      userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSLoginInternetConnectionError
                  userInfo: userInfo];
}

+ (NSError*) loginTimeoutError: (NSString*)     domain
                      userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSLoginTimeoutError
                  userInfo: userInfo];
}

+ (NSError*) serverError: (NSString*)     domain
                userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSServerkError
                  userInfo: userInfo];
}

+ (NSError*) calendarPermissionError: (NSString*)     domain
                            userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSCalendarPermissionError
                  userInfo: userInfo];
}

+ (NSError*) calendarDownloadError: (NSString*)     domain
                          userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSCalendarDownloadError
                  userInfo: userInfo];
}

+ (NSError*) noLocalCalendarError: (NSString*)     domain
                         userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSNoLocalCalendarError
                  userInfo: userInfo];
}

+ (NSError*) noDataError: (NSString*)     domain
                userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSNoDataError
                  userInfo: userInfo];
}

+ (NSError*) unknownError: (NSString*)     domain
                 userInfo: (NSDictionary*) userInfo
{
  return
  [NSError errorWithDomain: domain
                      code: ZSUnknownError
                  userInfo: userInfo];
}

@end

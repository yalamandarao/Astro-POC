//
//  APIConnector.m
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/9/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import "APIConnector.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworkActivityLogger/AFNetworkActivityLogger.h>
#import "AFNetworking+PromiseKit.h"
#import "StatusCodes.h"
#import "ErrorHelper.h"
#import "BaseURL.h"
#import "NSData+Base64.h"

@implementation APIConnector
{
  AFHTTPSessionManager* _sessionManager;
}

#pragma mark - Intialization

- (instancetype) init
{
  if (self = [super init])
  {
    [self _setupSessionManager];
    [[AFNetworkActivityLogger sharedLogger] startLogging];
  }
  return self;
}

#pragma mark - Utility methods

- (void) _setupSessionManager
{
  NSURL* baseURL = [BaseURL getBaseURL];

  _sessionManager
    = [[AFHTTPSessionManager alloc] initWithBaseURL: baseURL];
  _sessionManager.responseSerializer
    = [AFJSONResponseSerializer serializer];
  _sessionManager.requestSerializer
    = [AFJSONRequestSerializer serializer];
}

- (void) _handeError: (NSError*)     error
            resolver: (PMKResolver)  resolve
{
  NSError* maskedError = nil;
  NSHTTPURLResponse* response = nil;
  NSDictionary* userInfo = nil;
  NSDictionary* errorJSON = @{};

  /* Find wrapped response and user info */
  
  if (error.userInfo[AFHTTPRequestOperationErrorKey])
  {
    response
      = (NSHTTPURLResponse*)
        [error.userInfo[AFHTTPRequestOperationErrorKey] response];

    userInfo = error.userInfo;
  }
  else if (error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey])
  {
    response
      = (NSHTTPURLResponse*)
        error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];

    userInfo = error.userInfo;
  }
  else if (error.userInfo[NSUnderlyingErrorKey] != nil)
  {
    NSError* underlyingError = error.userInfo[NSUnderlyingErrorKey];

    response = (NSHTTPURLResponse*) underlyingError
       .userInfo[AFNetworkingOperationFailingURLResponseErrorKey];

    userInfo = underlyingError.userInfo;
  }

  /* If we found any response, handle it */
  
  if (response != nil)
  { 
    NSData* errorData
      = userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
    errorJSON
      = [NSJSONSerialization JSONObjectWithData: errorData
                                        options: 0
                                          error: nil];
    
    if (response.statusCode == StatusUnauthorized)
    {
      [[NSNotificationCenter defaultCenter]
        postNotificationName: kInvalidTokenNotification
                      object: nil];
    }
    
    maskedError
      = [NSError errorWithDomain: kConnectionErrorDomain
                            code: response.statusCode
                        userInfo: userInfo];
  }
  else
  {
    if (error.code == NSURLErrorNotConnectedToInternet ||
        error.code == NSURLErrorNetworkConnectionLost  ||
        error.code == NSURLErrorResourceUnavailable  )
    {
      maskedError
        = [ErrorHelper
            internetConnectionErrorWithDomain: kConnectionErrorDomain
                                     userInfo: userInfo];
    }
    else if (      error.code == NSURLErrorCannotConnectToHost ||
             error.code == NSURLErrorCannotFindHost ||
             error.code == NSURLErrorDNSLookupFailed ||
             error.code == NSURLErrorBadServerResponse ||
             error.code == NSURLErrorTimedOut)
    {
      maskedError
        = [ErrorHelper
            serverError: kConnectionErrorDomain
               userInfo: userInfo];
    }
    else
    {
      maskedError
        = [NSError errorWithDomain: kConnectionErrorDomain
                              code: StatusUnknownError
                          userInfo: userInfo];
    }
  }
  resolve(PMKManifold(maskedError, errorJSON));
}

- (PMKPromise*) _sendPOSTWithURL: (NSString*)     url
                          params: (NSDictionary*) params
{
  return
    [PMKPromise promiseWithResolver:
     ^(PMKResolver resolve)
     {

       [_sessionManager POST: url
                  parameters: params]
       .then(^(id resultObject, AFHTTPRequestOperation* op)
       {
         resolve(resultObject);
       })
       .catch(^(NSError* error)
        {
          NSData* errorData
            = error.userInfo[@"com.alamofire.serialization.response.error.data"];
          
          NSString* errorString
            = [[NSString alloc] initWithData: errorData
                                    encoding: NSUTF8StringEncoding];
          
          NSLog(@"Data Error: %@", errorString);
          
          [self _handeError: error
                   resolver: resolve];
        });
     }];
}

- (PMKPromise*) _sendGETWithURL: (NSString*)     url
                         params: (NSDictionary*) params
{
  return
    [PMKPromise promiseWithResolver:
     ^(PMKResolver resolve)
     {
       [_sessionManager GET: url
                 parameters: params]
       .then(^(id resultObject, AFHTTPRequestOperation* op)
       {
         resolve(resultObject);
       })
       .catch(^(NSError* error)
        {
          [self _handeError: error
                   resolver: resolve];
        });
     }];
}

#pragma mark - IAPIConnector

- (PMKPromise*) getGetChannelList: (NSDictionary*) params
{
  return [self _sendGETWithURL:kChannelList params:params];
}


@end

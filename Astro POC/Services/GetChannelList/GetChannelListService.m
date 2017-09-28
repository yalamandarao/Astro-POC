//
//  GetChannelListService.m
//  Astro POC
//
//  Created by yalamanda inaganti on 9/25/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "GetChannelListService.h"
#import "IAPIConnector.h"
#import <PromiseKit/PromiseKit.h>
#import "ErrorHelper.h"
#import "APIConnector.h"
#import "ChannelListParser.h"
#import "IChannelListStorage.h"
#import "GetChannelListService.h"
#define kDomainError @"astro.channelList.service"

@interface GetChannelListService ()

@property (nonatomic, strong) id<IAPIConnector> connector;

@end

@implementation GetChannelListService



- (instancetype) initWithConnector: (id<IAPIConnector>)      connector
                           storage: (id<IChannelListStorage>) storage
                        dataParser: (id<IDataParser>)        dataParser
{
    if (self = [super init])
    {
        _connector = connector;
        _storage = storage;
        _dataParser = dataParser;
        
    }
    return self;
}

- (PMKPromise*) getChannelListData
{
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject)
            {
                id<IAPIConnector> connector = _connector;
                
                [connector getGetChannelList: nil]
                .then(^(NSDictionary* result)
                      {
                          
                          NSString* resultStatus = result != nil ? result[@"responseCode"] : @"";
                          NSString* resultMessage = result != nil ? result[@"responseMessage"] : @"";
                          
                          if([resultStatus isEqualToString: @"200"])
                          {
                              
                              if (result[@"channels"] != nil)
                              {
                                  id<IChannelListStorage> storage = _storage;
                                  id<IDataParser> parser = _dataParser;
                                  NSDictionary* dataDict = result[@"channels"];
                                  NSMutableArray *channelList = [parser parse:dataDict];
                                  [storage saveChannelList:channelList]
                                .then(^{
                                   fulfill(@"success");
                                });
                                
                              }
                              else
                              {
                                  NSError* error
                                  = [ErrorHelper noDataError: kDomainError
                                                    userInfo: @{@"Message": resultMessage}];
                                  reject(error);
                              }
                          }
                          else if([resultStatus isEqualToString: @"400"])
                          {
                              NSError* error
                              = [ErrorHelper noDataError: kDomainError
                                                userInfo: @{@"Message": resultMessage}];
                              reject(error);
                          }
                          else if([resultStatus isEqualToString: @"401"])
                          {
                              NSError* error
                              = [ErrorHelper noDataError: kDomainError
                                                userInfo: @{@"Message": resultMessage}];
                              reject(error);
                          }
                          else if([resultStatus isEqualToString: @"403"])
                          {
                              NSError* error
                              = [ErrorHelper noDataError: kDomainError
                                                userInfo: @{@"Message": resultMessage}];
                              reject(error);
                          }
                          else if([resultStatus isEqualToString: @"404"])
                          {
                              NSError* error
                              = [ErrorHelper noDataError: kDomainError
                                                userInfo: @{@"Message": resultMessage}];
                              reject(error);
                          }
                          else if([resultStatus isEqualToString: @"405"])
                          {
                              NSError* error
                              = [ErrorHelper noDataError: kDomainError
                                                userInfo: @{@"Message": resultMessage}];
                              reject(error);
                          }
                          else if([resultStatus isEqualToString: @"500"])
                          {
                              NSError* error
                              = [ErrorHelper noDataError: kDomainError
                                                userInfo: @{@"Message": resultMessage}];
                              reject(error);
                          }
                      })
                .catch(^(NSError* error)
                       {
                           NSLog(@"Zimmer result request error: %@", error.localizedDescription);
                           reject(error);
                       });
            }];
    
}

@end

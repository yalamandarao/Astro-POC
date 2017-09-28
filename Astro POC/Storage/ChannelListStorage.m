//
//  CChannelListStorag.m
//  Zimmer Sports
//
//  Created by Yalamandarao on 08/09/17.
//  Copyright © 2017 Nano Equipment Pte Ltd. All rights reserved.
//

#import "ChannelListStorage.h"
#import <realm/Realm.h>
#import "IRealmProvider.h"
#import <PromiseKit/Promise.h>
#import "ChannelList.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation ChannelListStorage

- (instancetype) initWithRealmProvider: (id<IRealmProvider>) realmProvider
{
    if (self = [super init])
    {
        NSParameterAssert(realmProvider != nil);
        _realmProvider = realmProvider;
    }
    return self;
}

- (NSMutableArray*) getChannelList
{
    return nil;
}


#pragma mark - Get selected data

- (PMKPromise*) getChannelHistory: (NSMutableArray *) selectedItemsArray
{
  return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject)
          {
  RLMRealm* realm = _realmProvider.realm;
  RLMResults* object = nil;
  
  if (realm  != nil) {
    object = [[ChannelList allObjectsInRealm: realm]
              sortedResultsUsingKeyPath: @"channelTitle"
              ascending: YES];
  }
              BOOL value = NO;
              if ([FBSDKAccessToken currentAccessToken]) {
                  value = YES;
              }
  NSMutableArray *chanelListArray = [[NSMutableArray alloc] init];
  
  for (ChannelList* channelList in object)
  {
      ChannelList* copy = [ChannelList new];
      [copy copy: channelList];
      if (value) {
          if (selectedItemsArray.count != 0) {

          NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", channelList.channelId];
          NSArray *results = [selectedItemsArray filteredArrayUsingPredicate:predicate];
          if (results.count > 0) {
              copy.isFavoriteSelected = YES;
          }
          }
      }
    
    [chanelListArray addObject:copy];
  }
  
    fulfill(chanelListArray);
  }];
}

#pragma mark - Save MainBraches

- (PMKPromise*) saveChannelList: (NSArray*) channelListArray
{
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject)
            {
                RLMRealm* realm = _realmProvider.realm;
                
                if (channelListArray.count > 0)
                {
                    
                    for (ChannelList* channelList in channelListArray)
                    {
                            [realm beginWriteTransaction];
                            [realm addOrUpdateObject:channelList];
                            [realm commitWriteTransaction];
                    }
                }
                
                fulfill(@"sucess");
            }];
}

- (PMKPromise*) updateChannelList: (ChannelList*) channelList
{
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject)
            {
                RLMRealm* realm = _realmProvider.realm;
    
                [realm beginWriteTransaction];
                [realm addOrUpdateObject:channelList];
                [realm commitWriteTransaction];
              
                fulfill(@"sucess");
            }];
}


@end

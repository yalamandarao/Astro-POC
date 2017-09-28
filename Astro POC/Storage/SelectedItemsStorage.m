//
//  SelectedItemsStorage.m
//  Astro POC
//
//  Created by yalamanda inaganti on 9/28/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "SelectedItemsStorage.h"
#import <realm/Realm.h>
#import "IRealmProvider.h"
#import <PromiseKit/Promise.h>
#import "Favourite.h"

@implementation SelectedItemsStorage

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

- (PMKPromise*) getFavouriteHistory
{
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject)
            {
                RLMRealm* realm = _realmProvider.realm;
                RLMResults* object = nil;
                
                NSPredicate* predicate
                = [NSPredicate predicateWithFormat: @"isFavoriteSelected == YES"];
             
                
                if (realm  != nil) {
                    object = [[Favourite objectsInRealm: realm
                                         withPredicate: predicate]
                              sortedResultsUsingKeyPath: @"channelTitle"
                              ascending: NO];
                }
                
            
                
                NSMutableArray *favouriteArray = [[NSMutableArray alloc] init];
                
                for (Favourite* favourite in object)
                {
                    Favourite* copy = [Favourite new];
                    [copy copy: favourite];
                    [favouriteArray addObject:copy.channelId];
                }
                
                fulfill(favouriteArray);
            }];
}

#pragma mark - Save MainBraches

- (PMKPromise*) saveFavourite: (Favourite*) favourite
{
    return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject)
            {
                RLMRealm* realm = _realmProvider.realm;
                
                        [realm beginWriteTransaction];
                        [realm addOrUpdateObject:favourite];
                        [realm commitWriteTransaction];
                
                fulfill(@"sucess");
            }];
}

@end

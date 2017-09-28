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


//#pragma mark - Get selected data
//
//- (NSMutableArray*) downloadImagesFromCategoryList
//{
//    RLMRealm* realm = _realmProvider.realm;
//    
//    NSPredicate* predicate
//    = [NSPredicate predicateWithFormat: @"isDownloadCategoryImage == %@",
//       @(NO)];
//    
//    RLMResults* object = nil;
//    
//    if (realm  != nil) {
//        object = [[CategoryList objectsInRealm: realm
//                                 withPredicate: predicate]
//                  sortedResultsUsingKeyPath: @"categoryID"
//                  ascending: NO];
//    }
//    
//    NSMutableArray *categoryListArray = [[NSMutableArray alloc] init];
//    
//    for (CategoryList* categoryList in object)
//    {
//        CategoryList* copy = [CategoryList new];
//        [copy copy: categoryList];
//        [categoryListArray addObject:copy];
//    }
//    
//    return categoryListArray;
//}
//
//#pragma mark - Get folder category list based Folder id
//
//- (NSMutableArray*) categoryListHistory: (NSString *) categoryID
//{
//    RLMRealm* realm = _realmProvider.realm;
//    
//    NSPredicate* predicate
//    = [NSPredicate predicateWithFormat: @"categoryID == %@",
//       categoryID];
//    
//    RLMResults* object = nil;
//    
//    if (realm  != nil) {
//        object = [[CategoryList objectsInRealm: realm
//                                 withPredicate: predicate]
//                  sortedResultsUsingKeyPath: @"categoryID"
//                  ascending: NO];
//    }
//    
//    NSMutableArray *categoryListArray = [[NSMutableArray alloc] init];
//    
//    for (CategoryList* categoryList in object)
//    {
//        CategoryList* copy = [CategoryList new];
//        [copy copy: categoryList];
//        [categoryListArray addObject:copy];
//    }
//    
//    return categoryListArray;
//}
//
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
//
//#pragma mark - Delete MainBraches
//
//- (void) deleteDocument: (CategoryList*) categoryList
//{
//    
//    RLMRealm* realm = _realmProvider.realm;
//    
//    CategoryList* categoryListRLMObject
//    = [CategoryList objectInRealm: realm
//                    forPrimaryKey: categoryList.categoryID];
//    
//    if (categoryListRLMObject != nil)
//    {
//        [realm beginWriteTransaction];
//        [realm deleteObject: categoryListRLMObject];
//        [realm commitWriteTransaction];
//    }
//    
//}
//

@end

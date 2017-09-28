//
//  IChannelListStorag.h
//  Zimmer Sports
//
//  Created by Yalamandarao on 08/09/17.
//  Copyright © 2017 Nano Equipment Pte Ltd. All rights reserved.
//


#import <PromiseKit/Promise.h>
#import <Foundation/Foundation.h>
#import "ChannelList.h"

@class PMKPromise;
@class ChannelListStorage;

@protocol IChannelListStorage <NSObject>

- (PMKPromise*) getChannelHistory: (NSMutableArray *) selectedItemsArray;

- (PMKPromise*) saveChannelList: (NSArray*) channelListArray;

- (PMKPromise*) updateChannelList: (ChannelList*) channelList;

@end

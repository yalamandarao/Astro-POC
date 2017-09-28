//
//  ISelectedItemsStorage.h
//  Astro POC
//
//  Created by yalamanda inaganti on 9/28/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <PromiseKit/Promise.h>
#import <Foundation/Foundation.h>
#import "ChannelList.h"
#import "Favourite.h"

@class PMKPromise;
@class SelectedItemsStorage;

@protocol ISelectedItemsStorage <NSObject>

- (PMKPromise*) saveFavourite: (Favourite*) favourite;
- (PMKPromise*) getFavouriteHistory;

@end

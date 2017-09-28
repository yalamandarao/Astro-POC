//
//  SelectedItemsStorage.h
//  Astro POC
//
//  Created by yalamanda inaganti on 9/28/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISelectedItemsStorage.h"

@protocol IRealmProvider;

@interface SelectedItemsStorage : NSObject<ISelectedItemsStorage>

@property (nonatomic, strong) id<IRealmProvider> realmProvider;

@end

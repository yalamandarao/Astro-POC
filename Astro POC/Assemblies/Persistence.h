//
//  Persistence.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "IRealmProvider.h"

@protocol IChannelListStorage;
@protocol ISelectedItemsStorage;

@interface Persistence : TyphoonAssembly <IRealmProvider>

- (id<IChannelListStorage>) channelListStorage;
- (id<ISelectedItemsStorage>) selectedItemsStorage;

@end

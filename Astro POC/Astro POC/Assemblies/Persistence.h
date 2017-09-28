//
//  Persistence.h
//  SafeDrive
//
//  Copyright (c) 2015 Netzon AB. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "IRealmProvider.h"

@protocol IChannelListStorage;

@interface Persistence : TyphoonAssembly <IRealmProvider>

- (id<IChannelListStorage>) channelListStorage;


@end

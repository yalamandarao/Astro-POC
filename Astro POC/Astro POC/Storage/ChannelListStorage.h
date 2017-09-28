//
//  ChannelListStorage.h
//  Zimmer Sports
//
//  Created by Yalamandarao on 08/09/17.
//  Copyright © 2017 Nano Equipment Pte Ltd. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "IChannelListStorage.h"

@protocol IRealmProvider;

@interface ChannelListStorage : NSObject<IChannelListStorage>

@property (nonatomic, strong) id<IRealmProvider> realmProvider;

@end

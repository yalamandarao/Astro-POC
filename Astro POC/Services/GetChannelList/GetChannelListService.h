//
//  GetChannelListService.h
//  Astro POC
//
//  Created by yalamanda inaganti on 9/25/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "IGetChannelListService.h"

@protocol IAPIConnector;
@protocol IChannelListStorage;
@protocol IDataParser;

@interface GetChannelListService : NSObject <IGetChannelListService>
@property (nonatomic, strong) id<IChannelListStorage> storage;
@property (nonatomic, strong) id<IDataParser> dataParser;

- (instancetype) initWithConnector: (id<IAPIConnector>)      connector
                           storage: (id<IChannelListStorage>) storage
                        dataParser: (id<IDataParser>)        dataParser;

@end

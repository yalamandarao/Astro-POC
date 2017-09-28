//
//  ChannelList.h
//  Astro POC
//
//  Created by yalamanda inaganti on 9/26/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface ChannelList : RLMObject

@property NSString* channelId;
@property NSString* channelStbNumber;
@property NSString* channelTitle;
@property BOOL isFavoriteSelected;
@property NSString *loginId;

- (instancetype) initWithChannelId: (NSString*) channelId
                  channelStbNumber: (NSString*) channelStbNumber
                      channelTitle: (NSString*) channelTitle
                isFavoriteSelected: (BOOL) isFavoriteSelected
                           loginId: (NSString*) loginId;

- (void) copy: (ChannelList*) channelList;

@end

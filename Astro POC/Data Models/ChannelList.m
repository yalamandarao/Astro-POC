//
//  ChannelList.m
//  Astro POC
//
//  Created by yalamanda inaganti on 9/26/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "ChannelList.h"

@implementation ChannelList

- (instancetype) initWithChannelId: (NSString*) channelId
                  channelStbNumber: (NSString*) channelStbNumber
                      channelTitle: (NSString*) channelTitle
                isFavoriteSelected: (BOOL) isFavoriteSelected
                           loginId: (NSString *)loginId
{
    if (self = [super init])
    {
        _channelId = channelId;
        _channelTitle = channelTitle;
        _channelStbNumber = channelStbNumber;
      _isFavoriteSelected = isFavoriteSelected;
        _loginId = loginId;
       
    }
    return self;
}

#pragma mark - RLMObject

+ (NSString*) primaryKey
{
    return NSStringFromSelector(@selector(channelId));
}


- (void) copy: (ChannelList*) channelList
{
    _channelId = channelList.channelId;
    _channelTitle = channelList.channelTitle;
    _channelStbNumber = channelList.channelStbNumber;
  _isFavoriteSelected = channelList.isFavoriteSelected;
    _loginId = channelList.loginId;
}

@end

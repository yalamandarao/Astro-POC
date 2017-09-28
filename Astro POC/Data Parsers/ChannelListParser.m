//
//  ChannelListParser.m
//  Astro POC
//
//  Created by yalamanda inaganti on 9/26/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "ChannelListParser.h"
#import "ChannelList.h"


@implementation ChannelListParser

- (id) parse: (NSDictionary*) data
{
    NSMutableArray *channelListArray = [NSMutableArray new];
    
    for (NSDictionary *resultData in data) {
    NSString* channelId
      = resultData[@"channelId"] == nil ? @"" : [NSString stringWithFormat:@"%@",resultData[@"channelId"]];
    NSString* channelStbNumber
      = resultData[@"channelStbNumber"] == nil ? @"" : [NSString stringWithFormat:@"%@",resultData[@"channelStbNumber"]];
    NSString* channelTitle
    = resultData[@"channelTitle"] == nil ? @"" : resultData[@"channelTitle"];
   
    ChannelList *channel = [[ChannelList alloc] initWithChannelId:channelId channelStbNumber:channelStbNumber channelTitle:channelTitle isFavoriteSelected:NO loginId:@""];
        [channelListArray addObject:channel];
    }
    return channelListArray;
}

@end

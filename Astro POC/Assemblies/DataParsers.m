//
//  DataParsers.m
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "DataParsers.h"
#import "ChannelListParser.h"


@implementation DataParsers

- (id<IDataParser>) channelListParser
{
  return
  [TyphoonDefinition withClass: ChannelListParser.class
                 configuration: ^(TyphoonDefinition* definition)
   {
     definition.scope = TyphoonScopePrototype;
   }];
}


@end

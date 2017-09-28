//
//  Services.m
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "Services.h"
#import "Persistence.h"
#import "Connector.h"
#import "DataParsers.h"
#import "GetChannelListService.h"
#import "DataParsers.h"


@interface Services ()

@property (nonatomic, readonly) Persistence* persistence;
@property (nonatomic, readonly) Connector* connector;
@property (nonatomic, readonly) DataParsers* dataParsers;

@end

@implementation Services

- (id<IGetChannelListService>) getChannelListService
{
  return
  [TyphoonDefinition withClass: GetChannelListService.class
                 configuration: ^(TyphoonDefinition* definition)
   {
     SEL selector = @selector(initWithConnector:storage:dataParser:);
     
     [definition useInitializer: selector
                     parameters: ^(TyphoonMethod* initializer)
      {
        [initializer injectParameterWith: _connector.APIConnector];
        [initializer injectParameterWith: _persistence.channelListStorage];
        [initializer injectParameterWith: _dataParsers.channelListParser];
      }];
     definition.scope = TyphoonScopeWeakSingleton;
   }];
}

@end

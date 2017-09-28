//
//  Services.m
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/3/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import "Services.h"
#import "Persistence.h"
#import "Connector.h"
#import "DataParsers.h"
#import "GetChannelListService.h"


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
    
     [definition injectProperty: @selector(connector)
                           with: _connector.APIConnector];
     
     definition.scope = TyphoonScopeLazySingleton;
   }];
}

@end

//
//  Connector.m
//  IntercorpWorkerApp
//
//  Created by Kevin on 21/9/15.
//  Copyright (c) 2015 Kevin Bernard San Gaspar. All rights reserved.
//

#import "Connector.h"
#import "APIConnector.h"

@interface Connector ()

@end

@implementation Connector

- (id<IAPIConnector>) APIConnector
{
  return
    [TyphoonDefinition withClass: APIConnector.class
                   configuration: ^(TyphoonDefinition* definition)
      {
        definition.scope = TyphoonScopeWeakSingleton;
      }];
}

@end

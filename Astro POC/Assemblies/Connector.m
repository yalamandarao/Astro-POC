//
//  Connector.m
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
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

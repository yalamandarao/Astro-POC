//
//  Persistence.m
//  SafeDrive
//
//  Copyright (c) 2015 Netzon AB. All rights reserved.
//

#import <Realm/Realm.h>
#import "Persistence.h"
#import "ChannelListStorage.h"

@interface Persistence ()

@end

@implementation Persistence

#pragma mark - Methods

- (RLMRealm*) realm
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.schemaVersion = 1;
    
    config.migrationBlock = ^(RLMMigration* migration, uint64_t oldSchemaVersion)
    {
      NSLog(@"Handling Migration");
    
    };
    [RLMRealmConfiguration setDefaultConfiguration: config];
  });
  
  return [TyphoonDefinition withClass: RLMRealm.class
                        configuration: ^(TyphoonDefinition* definition)
          { 
            [definition useInitializer: @selector(defaultRealm)];
            
            /* Realm objects are thread-local; this means that they cannot
             * be used in threads other than where they were created. The
             * required way to obtain access to a realm object is by
             * declaring a dependency to the IRealmProvider protocol and
             * obtaining the realm object from it at the point of execution
             * where it is needed.
             */
            definition.scope = TyphoonScopePrototype;
          }];
}

- (id<IChannelListStorage>) channelListStorage
{
  return
    [TyphoonDefinition withClass: ChannelListStorage.class
                   configuration: ^(TyphoonDefinition* definition)
      {
        [definition injectProperty: @selector(realmProvider)
                              with: self];
        definition.scope = TyphoonScopeWeakSingleton;
      }];
}


@end

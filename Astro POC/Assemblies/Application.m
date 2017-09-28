//
//  Application.m
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "Application.h"
#import "AppDelegate.h"
#import "Typhoon.h"
#import "Services.h"

@interface Application ()

@property (nonatomic, readonly) Services* services;

@end


@implementation Application

- (id<UIApplicationDelegate>) appDelegate
{
  return [TyphoonDefinition withClass: AppDelegate.class
                        configuration: ^(TyphoonDefinition* definition)
          {
            
          }];
}

- (UIStoryboard*) mainStoryboard
{
  return
  [TyphoonDefinition withClass: [TyphoonStoryboard class]
                 configuration: ^(TyphoonDefinition* definition)
   {
     [definition
      useInitializer: @selector(storyboardWithName:factory:bundle:)
      parameters: ^(TyphoonMethod* initializer)
      {
        [initializer injectParameterWith: @"Main"];
        [initializer injectParameterWith: self];
        [initializer injectParameterWith: [NSBundle mainBundle]];
      }];
   }];
}




@end

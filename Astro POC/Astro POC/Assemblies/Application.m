//
//  Application.m
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/2/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
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

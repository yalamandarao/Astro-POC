//
//  Presentation.m
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/2/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import "Presentation.h"
#import "Application.h"
#import "HomeViewController.h"
#import "Services.h"


@interface Presentation ()

@property (nonatomic, readonly) Application* application;
@property (nonatomic, readonly) Services* services;

@end

@implementation Presentation

- (HomeViewController*) homeViewController
{
  return
  [TyphoonDefinition withClass: HomeViewController.class
                 configuration: ^(TyphoonDefinition* definition)
   {
     [definition injectProperty: @selector(getChannelListService)
                           with: _services.getChannelListService];
     [definition injectProperty:@selector(channelListStorage)];

   }];
}

@end

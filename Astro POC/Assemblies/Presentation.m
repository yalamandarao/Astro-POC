//
//  Presentation.m
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
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
     [definition injectProperty:@selector(selectedItemsStorage)];

   }];
}

@end

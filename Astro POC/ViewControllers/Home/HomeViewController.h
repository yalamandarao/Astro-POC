//
//  HomeViewController.h
//  Astro POC
//
//  Created by yalamanda inaganti on 9/25/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookLoginView.h"

@protocol IGetChannelListService;
@protocol IChannelListStorage;
@protocol ISelectedItemsStorage;

@interface HomeViewController : UIViewController<FacebookLoginViewDelegate>
@property (nonatomic, strong) id<IGetChannelListService> getChannelListService;
@property (nonatomic, strong) id<IChannelListStorage> channelListStorage;
@property (nonatomic, strong) id<ISelectedItemsStorage> selectedItemsStorage;
@end

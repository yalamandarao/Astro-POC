//
//  HomeViewController.h
//  Astro POC
//
//  Created by yalamanda inaganti on 9/25/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IGetChannelListService;
@protocol IChannelListStorage;

@interface HomeViewController : UIViewController
@property (nonatomic, strong) id<IGetChannelListService> getChannelListService;
@property (nonatomic, strong) id<IChannelListStorage> channelListStorage;
@end

//
//  ChannelTableViewCell.h
//  Astro POC
//
//  Created by yalamanda inaganti on 9/26/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelList.h"

@interface ChannelTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *channelTittle;
@property (nonatomic, weak) IBOutlet UILabel *channelNumber;
@property (nonatomic, strong) ChannelList* channelList;
@property (nonatomic, strong) IBOutlet UIButton *favoriteButton;

@end

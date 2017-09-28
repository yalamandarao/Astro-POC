//
//  ChannelTableViewCell.m
//  Astro POC
//
//  Created by yalamanda inaganti on 9/26/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "ChannelTableViewCell.h"
#import "ChannelList.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation ChannelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.channelList = self.channelList;
    // Initialization code
}

- (void) setChannelList:(ChannelList *)channelList {
  _channelList = channelList;
  if (_channelList) {
    _channelTittle.text = _channelList.channelTitle;
    _channelNumber.text = _channelList.channelStbNumber;
      
      if ([FBSDKAccessToken currentAccessToken]) {
          if (_channelList.isFavoriteSelected) {
              [_favoriteButton setImage:[UIImage imageNamed:@"fav_selected"] forState:UIControlStateNormal];
          }
          else
          {
              [_favoriteButton setImage:[UIImage imageNamed:@"fav_unselected"] forState:UIControlStateNormal];
          }
      }
      else
      {
          [_favoriteButton setImage:[UIImage imageNamed:@"fav_unselected"] forState:UIControlStateNormal];
      }
  
    
  }
}



@end

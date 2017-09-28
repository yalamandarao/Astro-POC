//
//  FacebookLoginView.h
//  Astro POC
//
//  Created by Yalamandarao on 27/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FacebookLoginViewDelegate <NSObject>
- (void) cancelThePopUpWithLoginInfo;
- (void) cancelThePopUp;
@end

@interface FacebookLoginView : UIView
@property (nonatomic, weak) id <FacebookLoginViewDelegate> delegate;
@end

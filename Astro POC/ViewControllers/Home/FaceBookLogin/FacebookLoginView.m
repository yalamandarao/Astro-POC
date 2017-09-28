//
//  FacebookLoginView.m
//  Astro POC
//
//  Created by Yalamandarao on 27/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "FacebookLoginView.h"

@implementation FacebookLoginView


- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (IBAction)facebookButtonTap:(id)sender
{
    [self.delegate cancelThePopUpWithLoginInfo];
}

- (IBAction) cancelButtonTap:(id)sender
{
   [self.delegate cancelThePopUp];
}


@end

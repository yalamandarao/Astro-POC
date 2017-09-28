//
//  PlaceHolderTextField.m
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "PlaceHolderTextField.h"

@implementation PlaceHolderTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 15, 0);
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 15, 0);
}


@end

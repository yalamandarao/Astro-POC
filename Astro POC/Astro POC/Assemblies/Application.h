//
//  Application.h
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/2/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import "TyphoonAssembly.h"
#import <UIKit/UIKit.h>

@interface Application : TyphoonAssembly

- (id<UIApplicationDelegate>) appDelegate;
- (UIStoryboard*) mainStoryboard;

@end

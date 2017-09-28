//
//  Application.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "TyphoonAssembly.h"
#import <UIKit/UIKit.h>

@interface Application : TyphoonAssembly

- (id<UIApplicationDelegate>) appDelegate;
- (UIStoryboard*) mainStoryboard;

@end

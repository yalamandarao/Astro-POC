//
//  CommonNumberUtil.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonNumberUtil : NSObject

+ (NSInteger) intForValue: (id) value;
+ (long long) longForValue: (id) value;
+ (double) doubleForValue: (id) value;
+ (float) floatForValue: (id) value;

@end

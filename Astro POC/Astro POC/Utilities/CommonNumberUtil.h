//
//  CommonNumberUtil.h
//  IntercorpWorkerApp
//
//  Created by Kevin Bernard R. San Gaspar on 10/6/15.
//  Copyright © 2015 Kevin Bernard San Gaspar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonNumberUtil : NSObject

+ (NSInteger) intForValue: (id) value;
+ (long long) longForValue: (id) value;
+ (double) doubleForValue: (id) value;
+ (float) floatForValue: (id) value;

@end

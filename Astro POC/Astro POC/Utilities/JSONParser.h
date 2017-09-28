//
//  JSONParser.h
//  IntercorpWorkerApp
//
//  Created by Kevin Bernard R. San Gaspar on 10/12/15.
//  Copyright © 2015 Kevin Bernard San Gaspar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

- (instancetype) initWithJSONDict: (NSDictionary*) jsonDict;
- (NSInteger) intForKey: (NSString*) key;
- (long) longForKey: (NSString*) key;
- (float) floatForKey: (NSString*) key;
- (double) doubleForKey: (NSString*) key;
- (NSDate*) dateForKey: (NSString*) key;
- (NSData*) imageDataForKey: (NSString*) key;
- (NSString*) stringForKey: (NSString*) key;
- (NSArray*) arrayForKey: (NSString*) key;
- (bool) boolForKey: (NSString*) key;

@end

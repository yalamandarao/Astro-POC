//
//  IDataParser.h
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/10/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IDataParser <NSObject>

- (id) parse: (NSDictionary*) data;

@end
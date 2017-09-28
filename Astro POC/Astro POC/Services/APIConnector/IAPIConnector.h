//
//  IAPIConnector.h
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/9/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#define TOKEN_HEADER @"UserToken"
#define USERNAME_HEADER @"Username"
#define kInvalidTokenNotification @"kInvalidTokenNotification"
#define kTokenExetended @"kTokenExetended"

@class PMKPromise;

@protocol IAPIConnector <NSObject>

- (PMKPromise*) getGetChannelList: (NSDictionary*) params;

@end

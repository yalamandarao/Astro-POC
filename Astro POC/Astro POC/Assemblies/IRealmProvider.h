//
//  IRealmProvider.h
//  SafeDrive
//
//  Copyright (c) 2015 Netzon AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RLMRealm;

@protocol IRealmProvider <NSObject>

- (RLMRealm*) realm;

@end

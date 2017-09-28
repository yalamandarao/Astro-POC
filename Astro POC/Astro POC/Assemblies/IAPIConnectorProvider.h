//
//  IAPIConnectorProvider.h
//  IntercorpWorkerApp
//
//  Created by Kevin on 21/9/15.
//  Copyright (c) 2015 Kevin Bernard San Gaspar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IAPIConnector;

@protocol IAPIConnectorProvider <NSObject>

- (id<IAPIConnector>) APIConnector;

@end


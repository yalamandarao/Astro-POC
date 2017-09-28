//
//  IAPIConnectorProvider.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IAPIConnector;

@protocol IAPIConnectorProvider <NSObject>

- (id<IAPIConnector>) APIConnector;

@end


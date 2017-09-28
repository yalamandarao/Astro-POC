//
//  Connector.h
//  IntercorpWorkerApp
//
//  Created by Kevin on 21/9/15.
//  Copyright (c) 2015 Kevin Bernard San Gaspar. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "IAPIConnectorProvider.h"

@interface Connector : TyphoonAssembly <IAPIConnectorProvider>

- (id<IAPIConnector>) APIConnector;

@end

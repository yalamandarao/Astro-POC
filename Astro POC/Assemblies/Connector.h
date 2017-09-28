//
//  Connector.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "IAPIConnectorProvider.h"

@interface Connector : TyphoonAssembly <IAPIConnectorProvider>

- (id<IAPIConnector>) APIConnector;

@end

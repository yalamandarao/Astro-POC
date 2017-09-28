//
//  DataParsers.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import "TyphoonAssembly.h"

@protocol IDataParser;

@interface DataParsers : TyphoonAssembly

- (id<IDataParser>) channelListParser;

@end

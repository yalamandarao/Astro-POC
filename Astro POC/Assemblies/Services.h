//
//  Services.h
//  Astro POC
//
//  Created by Yalamandarao on 28/09/17.
//  Copyright © 2017 yalamanda inaganti. All rights reserved.
//

#import <Typhoon/Typhoon.h>
@protocol IGetChannelListService;

@interface Services : TyphoonAssembly

- (id<IGetChannelListService>) getChannelListService;

@end

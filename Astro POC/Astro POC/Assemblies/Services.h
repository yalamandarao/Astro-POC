//
//  Services.h
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 11/3/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import <Typhoon/Typhoon.h>
@protocol IGetChannelListService;

@interface Services : TyphoonAssembly

- (id<IGetChannelListService>) getChannelListService;

@end

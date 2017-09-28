//
//  IGetIndexData.h
//  Zimmer Sports
//
//  Created by Yalamandarao on 06/09/17.
//  Copyright © 2017 Nano Equipment Pte Ltd. All rights reserved.
//

@class PMKPromise;

@protocol IGetChannelListService <NSObject>

- (PMKPromise*) getChannelListData;

@end

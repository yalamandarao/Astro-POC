//
//  APIConnector.h
//  Zimmer
//
//  Created by Kevin Bernard R. San Gaspar on 11/9/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAPIConnector.h"

#define kConnectionErrorDomain @"np.astro.connection.error.domain"
#define kChannelList           @"ams/v3/getChannelList"


@interface APIConnector : NSObject <IAPIConnector>

@end

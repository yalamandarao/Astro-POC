//
//  AlertHelper.h
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 21/11/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertHelper : NSObject

+ (UIAlertController* _Nonnull) alertWithTitle: (NSString* _Nonnull) title
                                       message: (NSString* _Nonnull) message
                                        action: (NSString* _Nonnull) action;
+ (UIAlertController* _Nonnull) alertWithMessage: (NSString* _Nonnull) message;
+ (UIAlertController* _Nonnull) alertWithMessage: (NSString* _Nonnull) message
                                          action: (NSString* _Nonnull) action;
+ (UIAlertController* _Nonnull) confirmWithMessage: (NSString* _Nonnull) message
                                         okHandler:
    (void (^ __nullable)(UIAlertAction* __nullable action)) okHandler;

+ (UIAlertController* _Nonnull) confirmWithMessage: (NSString* _Nonnull) message
                                           okTitle: (NSString* _Nonnull) okTitle
                                         okHandler: (void (^ __nullable)
                                                      (UIAlertAction*)) okHandler
                              cancelTitle: (NSString* _Nonnull) cancelTitle;

+ (UIAlertController*) alertWithMessage: (NSString*) message
                                 action: (NSString*) action
                              okHandler:
(void (^ __nullable)(UIAlertAction* action)) okHandler;

+ (UIAlertController*) confirmWithMessage: (NSString*) message
                                  okTitle: (NSString*) okTitle
                                okHandler: (void (^ __nullable)
                                            (UIAlertAction *action)) okHandler
                              cancelTitle: (NSString*) cancelTitle
                            cancelHandler: (void (^ __nullable)
                                            (UIAlertAction *action)) cancelHandler;

@end

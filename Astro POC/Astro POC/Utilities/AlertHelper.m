//
//  AlertHelper.m
//  NPStudent
//
//  Created by Kevin Bernard R. San Gaspar on 21/11/15.
//  Copyright © 2015 Total eBiz Solutions Pte Ltd. All rights reserved.
//

#import "AlertHelper.h"

@implementation AlertHelper

+ (UIAlertController* _Nonnull) alertWithTitle: (NSString*) title
                                       message: (NSString*) message
                                        action: (NSString*) action
{
  UIAlertController * alert
    =  [UIAlertController
          alertControllerWithTitle: title
                           message: message
                    preferredStyle: UIAlertControllerStyleAlert];
  
  if (action != nil)
  {
    UIAlertAction* ok
      = [UIAlertAction
          actionWithTitle: action
                    style: UIAlertActionStyleDefault
                  handler: nil];
    
    [alert addAction: ok];
  }
  return alert;
}

+ (UIAlertController*) alertWithMessage: (NSString*) message
{
  return [self alertWithTitle: @""
                      message: message
                       action: nil];
}

+ (UIAlertController*) alertWithMessage: (NSString*) message
                                 action: (NSString*) action
{
  UIAlertController* alert
    =  [self alertWithTitle: @""
                    message: message
                     action: action];
  return alert;
}

+ (UIAlertController*) alertWithMessage: (NSString*) message
                                 action: (NSString*) action
                              okHandler:
  (void (^ __nullable)(UIAlertAction *action)) okHandler
{
  UIAlertController* alert
    =  [self alertWithTitle: @""
                    message: message
                     action: nil];
  UIAlertAction* ok
    = [UIAlertAction
       actionWithTitle: action
                 style: UIAlertActionStyleDefault
               handler: okHandler];
  
  [alert addAction: ok];
  return alert;
}

+ (UIAlertController*) confirmWithMessage: (NSString*) message
                                okHandler:
  (void (^ __nullable)(UIAlertAction *action)) okHandler
{
  UIAlertController* alert
    =  [self alertWithTitle: @""
                    message: message
                     action: nil];
  
  UIAlertAction* ok
    = [UIAlertAction
       actionWithTitle: @"Ok"
                 style: UIAlertActionStyleDefault
               handler: okHandler];
  
  UIAlertAction* cancel
    = [UIAlertAction
        actionWithTitle: @"Cancel"
                  style: UIAlertActionStyleDefault
                handler: nil];
  
  [alert addAction: ok];
  [alert addAction: cancel];
  return alert;
}

+ (UIAlertController* _Nonnull) confirmWithMessage: (NSString* _Nonnull) message
                                           okTitle: (NSString* _Nonnull) okTitle
                                         okHandler: (void (^ __nullable)
                                                     (UIAlertAction*)) okHandler
                                       cancelTitle: (NSString* _Nonnull) cancelTitle
{
  return
    [self confirmWithMessage: message
                     okTitle: okTitle
                   okHandler: okHandler
                 cancelTitle: cancelTitle
               cancelHandler: nil];
}

+ (UIAlertController*) confirmWithMessage: (NSString*) message
                                  okTitle: (NSString*) okTitle
                                okHandler: (void (^ __nullable)
                                            (UIAlertAction *action)) okHandler
                              cancelTitle: (NSString*) cancelTitle
                            cancelHandler: (void (^ __nullable)
                                            (UIAlertAction *action)) cancelHandler
{
  UIAlertController * alert
    = [UIAlertController
        alertControllerWithTitle: @""
             message: message
      preferredStyle: UIAlertControllerStyleAlert];
  
  UIAlertAction* ok
    = [UIAlertAction
        actionWithTitle: okTitle
                  style: UIAlertActionStyleDefault
                handler: okHandler];
  
  UIAlertAction* cancel
    = [UIAlertAction
        actionWithTitle: cancelTitle
                  style: UIAlertActionStyleDefault
                handler: cancelHandler];
  
  [alert addAction: cancel];
  [alert addAction: ok];
  return alert;
}



@end

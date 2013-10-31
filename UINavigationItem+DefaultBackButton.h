//
//  UINavigationItem+DefaultBackButton.h
//  HausMed
//
//  Created by Ralph Schön on 31.10.13.
//  Copyright (c) 2013 HausMed eHealth Services GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (DefaultBackButton)

- (UIBarButtonItem *)backButtonWith:(NSString *)title tintColor:(UIColor *)color andAction:(SEL)action;

@end

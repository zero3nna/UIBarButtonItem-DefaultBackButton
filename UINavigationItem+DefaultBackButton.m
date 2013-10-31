//
//  UINavigationItem+DefaultBackButton.m
//  HausMed
//
//  Created by Ralph Schön on 31.10.13.
//  Copyright (c) 2013 HausMed eHealth Services GmbH. All rights reserved.
//

#import "UINavigationItem+DefaultBackButton.h"

@implementation UIBarButtonItem (DefaultBackButton)


- (UIBarButtonItem *)backButtonWith:(NSString *)title tintColor:(UIColor *)color andAction:(SEL)action {
    
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 110.0f, 20.5f)];
    UIImage *backImage = [[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    backImage = [backImage resizableImageWithCapInsets:UIEdgeInsetsMake(backImage.size.width, backImage.size.height, backImage.size.width, backImage.size.height)];
    
    // setting the image for both states
    [backButton setBackgroundImage:backImage  forState:UIControlStateNormal];
    [backButton setBackgroundImage:[self image:backImage byApplyingAlpha:0.3] forState:UIControlStateHighlighted];
    
    [backButton setTitleEdgeInsets:UIEdgeInsetsMake(2, 15, 0, 0)];
    [backButton setTitleColor:color forState:UIControlStateNormal];
    
    [backButton setTitle:title forState:UIControlStateNormal];
    const CGFloat* components = CGColorGetComponents(color.CGColor);
    [backButton setTitleColor:[UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:0.3f] forState:UIControlStateHighlighted];
    
    [backButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    return backButtonItem;
}

- (UIImage *)image:(UIImage *)image byApplyingAlpha:(CGFloat) alpha {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end

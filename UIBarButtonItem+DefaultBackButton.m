//
//  UINavigationItem+DefaultBackButton.m
//  HausMed
//
//  Created by Ralph Schön on 31.10.13.
//  Copyright (c) 2013 HausMed eHealth Services GmbH. All rights reserved.
//

#import "UIBarButtonItem+DefaultBackButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIBarButtonItem (DefaultBackButton)


- (UIBarButtonItem *)backButtonWith:(NSString *)title tintColor:(UIColor *)color target:(id)target andAction:(SEL)action {
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0, 0, 110.0f, 20.5f)];
    UIImage *backImage = [UIImage imageNamed:@"back.png"];
    //backImage = [self getImageWithUnsaturatedPixelsOfImage:backImage];
    backImage = [self image:backImage tintedWithColor:color fraction:0.0];
    
    // setting the image for both states
    [backButton setBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(backImage.size.width, backImage.size.height, backImage.size.width, backImage.size.height)] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[[self image:backImage byApplyingAlpha:0.3] resizableImageWithCapInsets:UIEdgeInsetsMake(backImage.size.width, backImage.size.height, backImage.size.width, backImage.size.height)] forState:UIControlStateHighlighted];
    
    [backButton setTitleEdgeInsets:UIEdgeInsetsMake(2, 15, 0, 0)];
    [backButton setTitle:title forState:UIControlStateNormal];
    
    [backButton setTitleColor:color forState:UIControlStateNormal];
    const CGFloat* components = CGColorGetComponents(color.CGColor);
    [backButton setTitleColor:[UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:0.3f] forState:UIControlStateHighlighted];
    
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButtonItem setTitle:title];
    
    
    return backButtonItem;
}

- (UIImage *)image:(UIImage *)image byApplyingAlpha:(CGFloat) alpha {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -rect.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, rect, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)image:(UIImage *)image tintedWithColor:(UIColor *)color fraction:(CGFloat)fraction
{
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    } else {
        UIGraphicsBeginImageContext([image size]);
    }
    CGRect rect = CGRectZero;
    rect.size = image.size;
    [color set];
    UIRectFill(rect);
    [image drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

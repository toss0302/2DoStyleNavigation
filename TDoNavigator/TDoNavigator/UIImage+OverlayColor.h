//
//  UIImage+OverlayColor.h
//  TDoNavigator
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//
//  Adapted from Dave Batton's answer on StackOverflow: 
//  http://stackoverflow.com/questions/1223340/iphone-how-do-you-color-an-image

#import <UIKit/UIKit.h>


@interface UIImage(OverlayColor)

+ (UIImage *)invertImageNamed:(NSString *)name;

- (UIImage *)imageWithOverlayColor:(UIColor *)color;

@end

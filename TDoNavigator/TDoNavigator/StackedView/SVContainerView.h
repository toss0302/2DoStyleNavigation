//
//  SVContainerView.h
//  StackedView
//
//  Created by BigWin on 7/17/11.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

enum {
    SVSideNone = 0x0,
    SVSideRight = 0x01,
    SVSideLeft = 0x02
}typedef SVSide;


@interface SVContainerView : UIView {
    UIView *transparentView_;
    CGFloat originalWidth_;
    SVSide shadow_;
    UIViewController *controller_;
    CAGradientLayer *leftShadowLayer_;
    CAGradientLayer *innerShadowLayer_;
	CAGradientLayer *rightShadowLayer_;
}

+ (SVContainerView *)containerViewWithController:(UIViewController *)controller;

/// limit to max width
- (CGFloat)limitToMaxWidth:(CGFloat)maxWidth;

/// add rounded masks. 
/// currently unused, because this needs offscreen-rendering, which is crazy slow
/// as a workaround, fake te rounded corners yourself
- (void)addMaskToCorners:(UIRectCorner)corners;
- (void)removeMask;

/// update shadow
- (void)updateContainer;

/// set shadow sides
@property(nonatomic, assign) SVSide shadow;

/// view controller that is being incapsulated
@property(nonatomic, strong) UIViewController *controller;

/// darken down the view if it's not fully visible
@property(nonatomic, assign) CGFloat darkRatio;

/// shadow width
@property(nonatomic, assign) CGFloat shadowWidth;

/// shadow alpha
@property(nonatomic, assign) CGFloat shadowAlpha;

/// corner radius
@property(nonatomic, assign) CGFloat cornerRadius;

@end

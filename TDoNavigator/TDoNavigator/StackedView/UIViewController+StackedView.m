//
//  UIViewController+StackedView.m
//  StackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "UIViewController+StackedView.h"
#import "SVContainerView.h"
#import "StackedViewController.h"
#import <objc/runtime.h>

#define kSVAssociatedStackViewControllerWidth @"kSVAssociatedStackViewControllerWidth"
#define kSVAssociatedStackViewControllerPanEnabled @"kSVAssociatedStackViewControllerPanEnabled"
#define kSVAssociatedStackViewControllerStretchable @"kSVAssociatedStackViewControllerStretchable" 

@implementation UIViewController (StackedView)

// returns the containerView, where view controllers are embedded
- (SVContainerView *)containerView; {
    return ([self.view.superview isKindOfClass:[SVContainerView class]] ? (SVContainerView *)self.view.superview : nil);
}

// returns the stack controller if the viewController is embedded
- (StackedViewController *)stackController; {
    StackedViewController *stackController = objc_getAssociatedObject(self, kSVAssociatedStackViewControllerKey);
    return stackController;
}

#ifdef ALLOW_SWIZZLING_NAVIGATIONCONTROLLER
/// to maintain minimal changes for your app, we can do some clever swizzling here.
- (UINavigationController *)navigationControllerSwizzled {
    if (!self.navigationControllerSwizzled) {
        return (UINavigationController *)self.stackController;
    }else {
        return self.navigationControllerSwizzled;
    }
}
#endif

- (CGFloat)stackWidth {
    NSNumber *stackWidthNumber = objc_getAssociatedObject(self, kSVAssociatedStackViewControllerWidth);
    CGFloat stackWidth = stackWidthNumber ? [stackWidthNumber floatValue] : 0.f;
    return stackWidth;
}

- (void)setStackWidth:(CGFloat)stackWidth {
    NSNumber *stackWidthNumber = [NSNumber numberWithFloat:stackWidth];
    objc_setAssociatedObject(self, kSVAssociatedStackViewControllerWidth, stackWidthNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)panEnabled
{
    NSNumber *panEnabledNumber = objc_getAssociatedObject(self, kSVAssociatedStackViewControllerPanEnabled);
    BOOL panEnabled = panEnabledNumber ? [panEnabledNumber boolValue] : YES;
    return panEnabled;
}

- (void)setPanEnabled:(BOOL)panEnabled
{
    NSNumber *panEnabledNumber = [NSNumber numberWithBool:panEnabled];
    objc_setAssociatedObject(self, kSVAssociatedStackViewControllerPanEnabled, panEnabledNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)stretchable
{
    NSNumber *stretchabledNumber = objc_getAssociatedObject(self, kSVAssociatedStackViewControllerStretchable);
    BOOL stretchable = stretchabledNumber ? [stretchabledNumber boolValue] : NO;
    return stretchable;
}

- (void)setStretchable:(BOOL)stretchable
{
    NSNumber *stretchableNumber = [NSNumber numberWithBool:stretchable];
    objc_setAssociatedObject(self, kSVAssociatedStackViewControllerStretchable, stretchableNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

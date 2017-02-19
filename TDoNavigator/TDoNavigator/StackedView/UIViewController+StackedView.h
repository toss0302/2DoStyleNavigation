//
//  UIViewController+StackedView.h
//  StackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackedViewGlobal.h"

@class SVContainerView, StackedViewController;

/// category for StackedView extensions
@interface UIViewController (StackedView)

- (CGFloat)stackWidth;
- (void)setStackWidth:(CGFloat)stackWidth;

/// returns the containerView, where view controllers are embedded
- (SVContainerView *)containerView;

/// returns the stack controller if the viewController is embedded
- (StackedViewController *)stackController;

- (BOOL)panEnabled;
- (void)setPanEnabled:(BOOL)panEnabled;

- (BOOL)stretchable;
- (void)setStretchable:(BOOL)stretchable;

@end

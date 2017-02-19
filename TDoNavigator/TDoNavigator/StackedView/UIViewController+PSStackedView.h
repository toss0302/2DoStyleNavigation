//
//  UIViewController+PSStackedView.h
//  3MobileTV
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSStackedViewGlobal.h"

@class PSSVContainerView, PSStackedViewController;

/// category for PSStackedView extensions
@interface UIViewController (PSStackedView)

- (CGFloat)stackWidth;
- (void)setStackWidth:(CGFloat)stackWidth;

/// returns the containerView, where view controllers are embedded
- (PSSVContainerView *)containerView;

/// returns the stack controller if the viewController is embedded
- (PSStackedViewController *)stackController;

- (BOOL)panEnabled;
- (void)setPanEnabled:(BOOL)panEnabled;

- (BOOL)stretchable;
- (void)setStretchable:(BOOL)stretchable;

@end

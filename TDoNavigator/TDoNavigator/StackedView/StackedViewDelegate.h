//
//  StackedViewDelegate.h
//  StackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StackedViewController;
@class UIViewController;

@protocol StackedViewDelegate <NSObject>

@optional

/// viewController will be inserted
- (void)stackedView:(StackedViewController *)stackedView willInsertViewController:(UIViewController *)viewController;

/// viewController has been inserted
- (void)stackedView:(StackedViewController *)stackedView didInsertViewController:(UIViewController *)viewController;

/// viewController will be removed
- (void)stackedView:(StackedViewController *)stackedView willRemoveViewController:(UIViewController *)viewController;

/// viewController has been removed
- (void)stackedView:(StackedViewController *)stackedView didRemoveViewController:(UIViewController *)viewController;

/// viewController has been panned
- (void)stackedView:(StackedViewController *)stackedView didPanViewController:(UIViewController *)viewController byOffset:(NSInteger)offset;

/// viewController has been aligned (programmatically or by result of panning)
- (void)stackedViewDidAlign:(StackedViewController *)stackedView;

@end

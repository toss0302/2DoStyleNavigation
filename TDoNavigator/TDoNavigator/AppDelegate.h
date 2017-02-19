//
//  AppDelegate.h
//  TDoNavigator
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackedView.h"

#define XAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@class StackedViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    StackedViewController *stackController_;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) StackedViewController *stackController;

@end


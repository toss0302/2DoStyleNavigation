//
//  AppDelegate.h
//  TDoNavigator
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSStackedView.h"

#define XAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@class PSStackedViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    PSStackedViewController *stackController_;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) PSStackedViewController *stackController;

@end


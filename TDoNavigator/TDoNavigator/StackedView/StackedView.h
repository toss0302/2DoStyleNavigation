//
//  StackedView.h
//  StackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "StackedViewDelegate.h"
#import "StackedViewController.h"
#import "SVContainerView.h"
#import "UIViewController+StackedView.h"

enum {
    SVLogLevelNothing,
    SVLogLevelError,    
    SVLogLevelInfo,
    SVLogLevelVerbose
}typedef SVLogLevel;

extern SVLogLevel kSVDebugLogLevel; // defaults to SVLogLevelError

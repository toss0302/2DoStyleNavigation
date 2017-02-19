//
//  PSStackedView.h
//  PSStackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "PSStackedViewDelegate.h"
#import "PSStackedViewController.h"
#import "PSSVContainerView.h"
#import "UIViewController+PSStackedView.h"

enum {
    PSSVLogLevelNothing,
    PSSVLogLevelError,    
    PSSVLogLevelInfo,
    PSSVLogLevelVerbose
}typedef PSSVLogLevel;

extern PSSVLogLevel kPSSVDebugLogLevel; // defaults to PSSVLogLevelError

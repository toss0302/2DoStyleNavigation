//
//  StackedViewGlobal.h
//  StackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "UIView+Sizes.h"

// Swizzles UIViewController's navigationController property. DANGER, WILL ROBINSON!
// Only swizzles if a StackedViewRootController is created, and also works in peaceful
// coexistance to UINavigationController.
//#define ALLOW_SWIZZLING_NAVIGATIONCONTROLLER

#define kSVAssociatedStackViewControllerKey @"kSVAssociatedStackViewController"

#define kSVStackedViewKitDebugEnabled

#define IsIpad() ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define AppStatusBarOrientation ([[UIApplication sharedApplication] statusBarOrientation])
#define IsPortrait()  UIInterfaceOrientationIsPortrait(AppStatusBarOrientation)
#define IsLandscape() UIInterfaceOrientationIsLandscape(AppStatusBarOrientation)

#ifdef kSVStackedViewKitDebugEnabled
#define SVLogVerbose(fmt, ...) do { if(kSVDebugLogLevel >= SVLogLevelVerbose) NSLog((@"%s/%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); }while(0)
#define SVLog(fmt, ...) do { if(kSVDebugLogLevel >= SVLogLevelInfo) NSLog((@"%s/%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); }while(0)
#define SVLogError(fmt, ...) do { if(kSVDebugLogLevel >= SVLogLevelError) NSLog((@"Error: %s/%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); }while(0)
#else
#define SVLogVerbose(...)
#define SVLog(...)
#define VSLogError(...)
#endif


#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_4_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_4_0 550.32
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
#define IF_IOS4_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iPhoneOS_4_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS4_OR_GREATER(...)
#endif

#define IF_PRE_IOS4(...)  \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iPhoneOS_4_0)  \
{ \
__VA_ARGS__ \
}

#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_5_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_5_0 674.0
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
#define IF_IOS5_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iPhoneOS_5_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS5_OR_GREATER(...)
#endif

#define IF_PRE_IOS5(...)  \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iPhoneOS_5_0)  \
{ \
__VA_ARGS__ \
}

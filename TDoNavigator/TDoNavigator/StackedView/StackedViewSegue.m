//
//  StackedViewSegue.m
//  StackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "StackedViewSegue.h"
#import "StackedViewController.h"
#import "UIViewController+StackedView.h"

@implementation StackedViewSegue

- (void)perform {
    StackedViewController* stackController = [self.sourceViewController stackController];
    [stackController pushViewController:self.destinationViewController fromViewController:self.sourceViewController animated:YES];
}

@end

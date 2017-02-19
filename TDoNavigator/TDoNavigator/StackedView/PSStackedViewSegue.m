//
//  PSStackedViewSegue.m
//  PSStackedView
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "PSStackedViewSegue.h"
#import "PSStackedViewController.h"
#import "UIViewController+PSStackedView.h"

@implementation PSStackedViewSegue

- (void)perform {
    PSStackedViewController* stackController = [self.sourceViewController stackController];
    [stackController pushViewController:self.destinationViewController fromViewController:self.sourceViewController animated:YES];
}

@end

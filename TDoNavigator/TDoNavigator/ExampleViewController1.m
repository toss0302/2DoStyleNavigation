//
//  ExampleViewController1.m
//  TDoNavigator
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "ExampleViewController1.h"
#import "StackedView.h"

@implementation ExampleViewController1

@synthesize indexNumber, indexNumberLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {

        // random color
        self.view.backgroundColor = [UIColor colorWithRed:((float)rand())/RAND_MAX green:((float)rand())/RAND_MAX blue:((float)rand())/RAND_MAX alpha:1.0];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.width = IsIpad() ? 400 : 150;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setIndexNumber:(NSUInteger)anIndexNumber {
    self.indexNumberLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)anIndexNumber];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - StackedViewDelegate

- (NSUInteger)stackableMinWidth; {
    return 100;
}


@end

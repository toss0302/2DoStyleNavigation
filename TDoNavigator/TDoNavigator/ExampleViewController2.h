//
//  ExampleViewController2.h
//  TDoNavigator
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#include "StackedViewDelegate.h"

@interface ExampleViewController2 : UITableViewController <StackedViewDelegate> {
    NSUInteger indexNumber_;
}

@property(nonatomic, assign) NSUInteger indexNumber;

@end

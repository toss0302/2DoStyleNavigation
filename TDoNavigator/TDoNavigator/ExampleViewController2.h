//
//  ExampleViewController2.h
//  PSStackedViewExample
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#include "PSStackedViewDelegate.h"

@interface ExampleViewController2 : UITableViewController <PSStackedViewDelegate> {
    NSUInteger indexNumber_;
}

@property(nonatomic, assign) NSUInteger indexNumber;

@end

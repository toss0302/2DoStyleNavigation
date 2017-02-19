//
//  ExampleViewController1.h
//  PSStackedViewExample
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#include <UIKit/UIKit.h>
#include "PSStackedViewDelegate.h"

@interface ExampleViewController1 : UIViewController <PSStackedViewDelegate>

@property(nonatomic, strong) IBOutlet UILabel *indexNumberLabel;
@property(nonatomic, assign) NSUInteger indexNumber;

@end

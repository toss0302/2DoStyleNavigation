//
//  ExampleViewController1.h
//  TDoNavigator
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#include <UIKit/UIKit.h>
#include "StackedViewDelegate.h"

@interface ExampleViewController1 : UIViewController <StackedViewDelegate>

@property(nonatomic, strong) IBOutlet UILabel *indexNumberLabel;
@property(nonatomic, assign) NSUInteger indexNumber;

@end

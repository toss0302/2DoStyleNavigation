//
//  ExampleMenuRootController.h
//  TDoNavigator
//
//  Created by BigWin on 7/18/11.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ExampleViewController1;

@interface ExampleMenuRootController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView *menuTable_;
    NSArray *cellContents_;
    
    ExampleViewController1 *page1;
    ExampleViewController1 *page2;
    ExampleViewController1 *page3;
}

- (void) initialSetup;

@end

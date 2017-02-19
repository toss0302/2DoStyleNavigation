//
//  ExampleMenuRootController.h
//  TDoNavigator
//
//  Created by BigWin on 7/18/11.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExampleMenuRootController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView *menuTable_;
    NSArray *cellContents_;
}

@end

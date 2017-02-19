//
//  ExampleMenuRootController.m
//  TDoNavigator
//
//  Created by BigWin on 7/18/11.
//  Copyright © 2017 Petr. All rights reserved.
//

#import "StackedView.h"
#import "AppDelegate.h"
#import "MenuTableViewCell.h"
#import "ExampleMenuRootController.h"
#import "ExampleViewController1.h"
#import "ExampleViewController2.h"
#import "UIImage+OverlayColor.h"

#include <QuartzCore/QuartzCore.h>

#include "Config.h"

#define kCellText @"CellText"
#define kCellImage @"CellImage" 

@interface ExampleMenuRootController()
@property (nonatomic, strong) UITableView *menuTable;
@property (nonatomic, strong) NSArray *cellContents;
@end

@implementation ExampleMenuRootController

@synthesize menuTable = menuTable_;
@synthesize cellContents = cellContents_;

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSObject



///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UIView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"load example view, frame: %@", NSStringFromCGRect(self.view.frame));
        
#if 0
    self.view.layer.borderColor = [UIColor greenColor].CGColor;
    self.view.layer.borderWidth = 2.f;
#endif
    
    // add example background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
//    self.view.backgroundColor = [UIColor colorWithRed:0.5f green:(157.0 / 255.0) blue:(179.0 / 255.0) alpha:1.0];

    
    // prepare menu content
    NSMutableArray *contents = [[NSMutableArray alloc] init];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                         [UIImage invertImageNamed:@"08-chat"], kCellImage,
                         NSLocalizedString(@"All",@""), kCellText, nil]];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                         [UIImage invertImageNamed:@"11-clock"], kCellImage,
                         NSLocalizedString(@"Today",@""), kCellText, nil]];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                         [UIImage invertImageNamed:@"15-tags"], kCellImage,
                         NSLocalizedString(@"Starred",@""), kCellText, nil]];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                         [UIImage invertImageNamed:@"08-chat"], kCellImage,
                         NSLocalizedString(@"Scheduled",@""), kCellText, nil]];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                         [UIImage invertImageNamed:@"11-clock"], kCellImage,
                         NSLocalizedString(@"Done",@""), kCellText, nil]];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                         [UIImage invertImageNamed:@"15-tags"], kCellImage,
                         NSLocalizedString(@"More",@""), kCellText, nil]];
    self.cellContents = contents;
    
    // add table menu
	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MENU_WIDTH_LAND, self.view.height) style:UITableViewStylePlain];
    self.menuTable = tableView;
    
    self.menuTable.backgroundColor = [UIColor colorWithRed:0.5f green:(157.0 / 255.0) blue:(179.0 / 255.0) alpha:1.0];
    self.menuTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.menuTable.delegate = self;
    self.menuTable.dataSource = self;
    [self.view addSubview:self.menuTable];
    [self.menuTable reloadData];
    
}

- (void) initialSetup {
    
    StackedViewController *stackController = XAppDelegate.stackController;
//    UIViewController*viewController = nil;
    
    // First View
    page1 = [[ExampleViewController1 alloc] initWithNibName:@"ExampleViewController1" bundle:nil];
    page1.indexNumber = [stackController.viewControllers count];
    if (IsPortrait()) {
        page1.view.width = self.view.width - MENU_WIDTH_LAND;
    } else {
        page1.view.width = roundf((self.view.width - MENU_WIDTH_LAND - SECOND_PAN_WIDTH));
    }
    if (page1) {
        [XAppDelegate.stackController pushViewController:page1 fromViewController:nil animated:YES];
    }

    // Second View
    page2 = [[ExampleViewController1 alloc] initWithNibName:@"ExampleViewController1" bundle:nil];
    page2.indexNumber = [stackController.viewControllers count];
    if (IsPortrait()) {
        page2.view.width = MENU_WIDTH_LAND;
    } else {
        page2.view.width = SECOND_PAN_WIDTH;
    }
    if (page2) {
        [XAppDelegate.stackController pushViewController:page2 fromViewController:nil animated:YES];
    }


    // Third View
    page3 = [[ExampleViewController1 alloc] initWithNibName:@"ExampleViewController1" bundle:nil];
    page3.indexNumber = [stackController.viewControllers count];
    if (IsPortrait()) {
        page3.view.width = MENU_WIDTH_LAND;
    } else {
        page3.view.width = MENU_WIDTH_LAND;
    }
    if (page3) {
        [XAppDelegate.stackController pushViewController:page3 fromViewController:nil animated:YES];
    }
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];

}

- (void) orientationChanged:(NSNotification *)note
{
    CGSize size = [UIScreen mainScreen].bounds.size;

    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationPortraitUpsideDown:
            /* start special animation */
        {
            float width1 = size.width - MENU_WIDTH_LAND;
            float width2 = MENU_WIDTH_LAND;
            float width3 = MENU_WIDTH_LAND;
            page1.view.frame = CGRectMake(page1.view.origin.x, page1.view.origin.x, width1, page1.view.height);
            page2.view.frame = CGRectMake(page2.view.origin.x, page2.view.origin.x, width2, page2.view.height);
            page3.view.frame = CGRectMake(page3.view.origin.x, page3.view.origin.x, width3, page3.view.height);
        }
            break;
            
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            /* start special animation */
        {
            float width1 = (size.width - MENU_WIDTH_LAND - SECOND_PAN_WIDTH);
            float width2 = SECOND_PAN_WIDTH;
            float width3 = MENU_WIDTH_LAND;
        
            page1.view.frame = CGRectMake(page1.view.origin.x, page1.view.origin.x, width1, page1.view.height);
            page2.view.frame = CGRectMake(page2.view.origin.x, page2.view.origin.x, width2, page2.view.height);
            page3.view.frame = CGRectMake(page3.view.origin.x, page3.view.origin.x, width3, page3.view.height);
        }
            break;
            
        default:
            break;
    };
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cellContents_ count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ExampleMenuCell";
    
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	cell.textLabel.text = [[cellContents_ objectAtIndex:indexPath.row] objectForKey:kCellText];
	cell.imageView.image = [[cellContents_ objectAtIndex:indexPath.row] objectForKey:kCellImage];
    cell.backgroundColor = [UIColor clearColor];
	    
    //if (indexPath.row == 5)
    //    cell.enabled = NO;
    
    return cell;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {  
//    StackedViewController *stackController = XAppDelegate.stackController;
//    UIViewController*viewController = nil;
//    
//    
//    if (indexPath.row < 3) {
//        // Pop everything off the stack to start a with a fresh app feature
//        // DISABLED FOR DEBUGGING
//        //[stackController popToRootViewControllerAnimated:YES];
//    }
//    
//    if (indexPath.row == 0) {
//        viewController = [[ExampleViewController1 alloc] initWithNibName:@"ExampleViewController1" bundle:nil];
//        ((ExampleViewController1 *)viewController).indexNumber = [stackController.viewControllers count];
//        viewController.view.width = SECOND_PAN_WIDTH;
//    }else if(indexPath.row == 1) {
//        viewController = [[ExampleViewController2 alloc] initWithStyle:UITableViewStylePlain];     
//        ((ExampleViewController2 *)viewController).indexNumber = [stackController.viewControllers count];
//        viewController.view.width = THIRD_PAN_WIDTH;
//    }else if(indexPath.row == 2) { // Twitter style
//        viewController = [[ExampleViewController1 alloc] initWithNibName:@"ExampleViewController1" bundle:nil];
//        ((ExampleViewController1 *)viewController).indexNumber = [stackController.viewControllers count];
////        viewController.view.width = roundf((self.view.width - stackController.leftInset)/2);
//        viewController.view.width = roundf((self.view.width - MENU_WIDTH_LAND - SECOND_PAN_WIDTH));
//
//    }
//    else if(indexPath.row == 3) {
//        [stackController collapseStack:1 animated:YES];
//    }else if(indexPath.row == 4) { // right
//        [stackController expandStack:1 animated:YES];
//    }else if(indexPath.row == 5) {
//        while ([stackController.viewControllers count]) {
//            [stackController popViewControllerAnimated:YES];
//        }
//    }
//    
//    if (viewController) {
//        [XAppDelegate.stackController pushViewController:viewController fromViewController:nil animated:YES];
//    }
}

@end

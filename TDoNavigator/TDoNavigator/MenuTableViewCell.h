//
//  MenuTableViewCell.h
//  TDoNavigator
//
//  Created by BigWin on 2/19/17.
//  Copyright © 2017 Petr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell {
	UIImageView *glowView;
    UIImage *savedImage;
}

@property(nonatomic,strong) UIImageView *glowView;
@property(nonatomic,strong) UIView *disabledView;
@property(nonatomic) BOOL enabled;

@end

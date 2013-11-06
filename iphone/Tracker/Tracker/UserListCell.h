//
//  UserListCell.h
//  Tracker
//
//  Created by Andrew Sheelan Paliyan on 11/6/13.
//  Copyright (c) 2013 Tracker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *currencyBalance;
@property (weak, nonatomic) IBOutlet UIImageView *currencyIcon;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

//
//  UserListCell.m
//  Tracker
//
//  Created by Andrew Sheelan Paliyan on 11/6/13.
//  Copyright (c) 2013 Tracker. All rights reserved.
//

#import "UserListCell.h"

@implementation UserListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

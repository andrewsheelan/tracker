//
//  UsersViewController.h
//  Tracker
//
//  Created by Andrew Sheelan Paliyan on 11/5/13.
//  Copyright (c) 2013 Tracker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *receivedData;
@end

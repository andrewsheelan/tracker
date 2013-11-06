//
//  CommonViewController.m
//  Tracker
//
//  Created by Andrew Sheelan Paliyan on 11/5/13.
//  Copyright (c) 2013 Tracker. All rights reserved.
//
#define HOST @"http://usertracker.herokuapp.com/"
#import "CommonViewController.h"

@interface CommonViewController ()

@end

@implementation CommonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (NSURL*)urlFor: (NSString*)urlString
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", HOST, urlString]];
}

@end

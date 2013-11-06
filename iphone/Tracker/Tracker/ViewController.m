//
//  ViewController.m
//  Tracker
//
//  Created by Mac Mini on 11/5/13.
//  Copyright (c) 2013 Tracker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableData *webData;
    NSURLConnection *connection;
    NSMutableArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    array = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

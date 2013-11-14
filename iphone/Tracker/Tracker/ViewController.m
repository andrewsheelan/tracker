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
    buttonSMS = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonSMS setFrame:CGRectMake(0, 0, 180, 40)];
    [buttonSMS setCenter:CGPointMake(160, 208)];
    [buttonSMS setTitle:@"Send SMS" forState:UIControlStateNormal];
    [buttonSMS addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:buttonSMS];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(UIButton *)button
{
    if (button == buttonSMS)
        [self sendSMS:@"Body of SMS..." recipientList:[NSArray arrayWithObjects:@"+1-111-222-3333", @"111-333-4444", nil]];
}

- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissModalViewControllerAnimated:YES];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled")
        else if (result == MessageComposeResultSent)
            NSLog(@"Message sent")
            else 
                NSLog(@"Message failed")  
                }

@end

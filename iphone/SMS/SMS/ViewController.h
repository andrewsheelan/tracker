//
//  ViewController.h
//  SMS
//
//  Created by Mac Mini on 11/14/13.
//  Copyright (c) 2013 Tracker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface ViewController : UIViewController <MFMessageComposeViewControllerDelegate>
    @property (strong, nonatomic) IBOutlet UIView *sendSML;

- (IBAction)buttonpressed:(id)sender; 

@end

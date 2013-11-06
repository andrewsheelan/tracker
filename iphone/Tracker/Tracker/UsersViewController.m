//
//  UsersViewController.m
//  Tracker
//
//  Created by Andrew Sheelan Paliyan on 11/5/13.
//  Copyright (c) 2013 Tracker. All rights reserved.
//

#import "UsersViewController.h"
#import "CommonViewController.h"
#import "UserListCell.h"
#import <CommonCrypto/CommonDigest.h>  
@interface UsersViewController ()

@end

@implementation UsersViewController {
    id responseBody;
    int responseStatusCode;
    NSMutableArray* listArray;

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    NSMutableURLRequest *request = nil;
    request = [NSMutableURLRequest requestWithURL:[CommonViewController urlFor: @"users.json"]];
    
    NSString *get = @"";
    NSData *getData = [get dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    [request setValue:[NSString stringWithFormat:@"%d", [getData length]] forHTTPHeaderField:@"Content-Length"];
    [request setTimeoutInterval: 15];
    [request setHTTPMethod:@"GET"];
    [request setHTTPBody:getData];
    
    NSURLConnection *_urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [_urlConnection start];
    NSLog(@"started connection... menu");
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
 return [listArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UserListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [listArray[indexPath.row] valueForKey:@"name"];
    cell.statusLabel.text = @"fgdfgd";
    NSData *data = [NSData dataWithContentsOfURL : [NSURL URLWithString:[NSString stringWithFormat:@"https://secure.gravatar.com/avatar/%@",[self md5:[listArray[indexPath.row] valueForKey:@"email"]]]] ];
    [cell.imageView setImage:[UIImage imageWithData:data]];
    
    // Configure the cell...
    
    return cell;
}

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}



#pragma mark -
#pragma mark URL Data connection
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.receivedData = [[NSMutableData alloc]init];
    [self.receivedData appendData:data];
    NSString *responseString = [[NSString alloc] initWithData: self.receivedData encoding: NSASCIIStringEncoding];
    NSLog(@"In COnnection recieved...%@", responseString);
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //Oops! handle failure here
    NSLog(@"In COnnection failed...");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *responseString = [[NSString alloc] initWithData: self.receivedData encoding: NSASCIIStringEncoding];
    NSError* error = nil;
    
    responseBody = [NSJSONSerialization JSONObjectWithData:self.receivedData
                                                   options:NSJSONReadingMutableContainers
                                                     error:&error];
    
    if(responseStatusCode!=200) {
        NSString* errorMessage = [responseBody valueForKey:@"message"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Occured"
                                                        message: errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    
    }
    else
    {
        int size = [responseBody count] - 1;
        NSLog(@"... size..%d", size);
        listArray = [[NSMutableArray alloc] initWithCapacity:size];
        int tmpIndex = 0;
        for(int row = 0; row < size+1; row++) {
            id rowObject = [responseBody objectAtIndex:row];
            listArray[tmpIndex++] = rowObject;            
        }
        
        [self.tableView reloadData];
        self.tableView.hidden = FALSE;
        NSLog(@"In COnnection loading...%@" , responseString);
    }
    
}

- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response {
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    responseStatusCode = [httpResponse statusCode];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

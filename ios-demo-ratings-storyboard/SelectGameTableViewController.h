//
//  SelectGameTableViewController.h
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 25/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectGameTableViewController : UITableViewController

@property (nonatomic, strong) NSString *selectedGame;
@property (nonatomic, strong) NSString *returnSegueIdentifier; // is this okay?

@end

//
//  PlayerDetailsTableViewController.h
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 23/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayerDetailsTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *gameLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@property (nonatomic, strong) Player *createdPlayer;

@end

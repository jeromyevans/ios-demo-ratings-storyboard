//
//  ViewPlayerDetailsViewController.h
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 25/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface ViewPlayerDetailsViewController : UITableViewController

@property (nonatomic, strong) Player *selectedPlayer;

@end

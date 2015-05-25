//
//  PlayerCellTableViewCell.h
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 18/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCellTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *gameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingImageView;
@end

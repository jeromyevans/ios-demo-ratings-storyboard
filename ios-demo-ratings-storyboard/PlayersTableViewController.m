//
//  PlayersTableViewController.m
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 18/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import "PlayersTableViewController.h"
#import "Player.h"
#import "PlayerCellTableViewCell.h"
#import "PlayerDetailsTableViewController.h"


@interface PlayersTableViewController ()

@end

@implementation PlayersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.players count];
}


- (UIImage *)imageForRating:(int)rating
{
    switch (rating) {
        case 1: return [UIImage imageNamed:@"1StarSmall"];
        case 2: return [UIImage imageNamed:@"2StarsSmall"];
        case 3: return [UIImage imageNamed:@"3StarsSmall"];
        case 4: return [UIImage imageNamed:@"4StarsSmall"];
        case 5: return [UIImage imageNamed:@"5StarsSmall"];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerCellTableViewCell *cell = (PlayerCellTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
                             
    Player *player = (self.players)[indexPath.row];
    
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingImageView.image = [self imageForRating:player.rating];
    
    return cell;
}


- (IBAction)unwindToPlayersList:(UIStoryboardSegue *)unwindSegue
{
    UIViewController* sourceViewController = unwindSegue.sourceViewController;

    if ([sourceViewController isKindOfClass:[PlayerDetailsTableViewController class]]) {
        NSLog(@"Unwind to players list!");
        
        PlayerDetailsTableViewController *playerDetailsTableViewController = (PlayerDetailsTableViewController *)sourceViewController;
        
        Player *newPlayer = playerDetailsTableViewController.createdPlayer;
        
        if (newPlayer != nil && newPlayer.name.length > 0) {
            [self didAddPlayer:newPlayer];
        }
    }
}

/*
 Add a new Player to the players list
*/
- (void) didAddPlayer:(Player *)player
{
    [self.players addObject:player];
    
    // add the the table
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

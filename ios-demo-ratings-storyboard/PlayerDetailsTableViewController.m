//
//  PlayerDetailsTableViewController.m
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 23/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import "PlayerDetailsTableViewController.h"
#import "Player.h"
#import "SelectGameTableViewController.h"

@interface PlayerDetailsTableViewController ()

@end

@implementation PlayerDetailsTableViewController

NSString *_game;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        _game = @"Chess";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    self.gameLabel.text = _game;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTouchDoneButton:(id)sender {
    [self createPlayer:self.nameTextField.text withGame:_game withRating:1];
    
    [self performSegueWithIdentifier:@"unwindToPlayersList" sender:self];
}

- (IBAction)didChangeValues:(id)sender {
    [self updateDoneButtonStatus:sender];
}


- (IBAction)unwindToPlayerDetails:(UIStoryboardSegue *)unwindSegue
{
    UIViewController* sourceViewController = unwindSegue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[SelectGameTableViewController class]]) {
        
        SelectGameTableViewController *selectGameTableViewController = (SelectGameTableViewController *)sourceViewController;
        
        _game = [selectGameTableViewController selectedGame];
    
        if (_game != nil) {
            self.gameLabel.text = _game;
        }
        else {
            self.gameLabel.text = @"";
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SelectGame"]) {
        SelectGameTableViewController *selectGameViewController = segue.destinationViewController;
        
        selectGameViewController.selectedGame =  _game;
    }
}

- (void)createPlayer: (NSString*) name withGame: (NSString*) game withRating: (int) rating {
    
    self.createdPlayer = [[Player alloc] init];

    self.createdPlayer.name = name;
    self.createdPlayer.game = game;
    self.createdPlayer.rating = rating;
}

- (void) clearPlayer {
    self.createdPlayer.name = @"";
    self.createdPlayer.game = @"";
    self.createdPlayer.rating = 1;
}

- (void)updateDoneButtonStatus:(id)sender {
    if ([self formIsComplete]) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
    else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}

/*
 Determine if the form is in a complete valid state
*/
- (Boolean)formIsComplete {
    return self.nameTextField.text.length > 0;
}

- (IBAction)didSetPlayerName:(UITextField *)sender {
    NSLog(@"setPlayerName!");
}

/*
 When the first row of the table is selected,
 select the nameTextField automatically
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTextField becomeFirstResponder];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

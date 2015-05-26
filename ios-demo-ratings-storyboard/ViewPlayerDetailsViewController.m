//
//  ViewPlayerDetailsViewController.m
//  ios-demo-ratings-storyboard
//
//  Created by Jeromy Evans (personal) on 25/05/2015.
//  Copyright (c) 2015 Jeromy Evans. All rights reserved.
//

#import "ViewPlayerDetailsViewController.h"
#import "SelectGameTableViewController.h"

@interface ViewPlayerDetailsViewController ()

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *gameLabel;

@end

@implementation ViewPlayerDetailsViewController {
    NSString *_game;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.selectedPlayer != nil) {
        
        self.nameTextField.text = self.selectedPlayer.name;
        
        _game = self.selectedPlayer.game;
        self.gameLabel.text = _game;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ChangeGame"]) {
        SelectGameTableViewController *selectGameViewController = segue.destinationViewController;
        
        selectGameViewController.selectedGame = _game;
        selectGameViewController.returnSegueIdentifier = @"unwindToViewPlayer";
    }
}

- (IBAction)didTouchDoneButton:(id)sender {
    [self updatePlayer:self.nameTextField.text withGame:_game withRating:1];
    
    [self performSegueWithIdentifier:@"unwindToPlayersList" sender:self];
}

- (void)updatePlayer: (NSString*) name withGame: (NSString*) game withRating: (int) rating {
    self.selectedPlayer.name = name;
    self.selectedPlayer.game = game;
    self.selectedPlayer.rating = rating;
}

- (IBAction)unwindToViewPlayer:(UIStoryboardSegue *)unwindSegue
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

@end

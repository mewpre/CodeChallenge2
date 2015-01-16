//
//  DetailViewController.m
//  CodeChallenge2
//
//  Created by Yi-Chin Sun on 1/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "DetailViewController.h"
#import "WikiViewController.h"

@interface DetailViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;


@property BOOL inEditModeWhenButtonPressed;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityLabel.text = [self.selectedCity getName];
    self.stateLabel.text = [self.selectedCity getState];
    self.backgroundImageView.image = [self.selectedCity getImage];

    //shows built-in clear buttons in text fields when editing
    self.cityTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.stateTextField.clearButtonMode = UITextFieldViewModeWhileEditing;

    self.cityTextField.hidden = YES;
    self.stateTextField.hidden = YES;

    self.inEditModeWhenButtonPressed = NO;

}

- (IBAction)onEditButtonTapped:(id)sender
{
    //If not in edit mode when button is pressed, enable editing
    if (!self.inEditModeWhenButtonPressed)
    {
        //Enable editing
        self.editButton.title = @"Done";
        //Make sure text fields are empty to beign with
        self.cityTextField.text = @"";
        self.stateTextField.text = @"";
        //sets placeholder text to the current city and state label text
        self.cityTextField.placeholder = self.cityLabel.text;
        self.stateTextField.placeholder = self.stateLabel.text;
    }
    //Only allow changes if both city and state are entered in text fields
    else if (!([self.cityTextField.text isEqualToString:@""] || [self.stateTextField.text isEqualToString:@""]))
    {
        //Save new input
        self.editButton.title = @"Edit";

        self.cityLabel.text = self.cityTextField.text;
        [self.selectedCity setName: self.cityTextField.text];

        self.stateLabel.text = self.stateTextField.text;
        [self.selectedCity setState: self.stateTextField.text];
    }
    //show text fields when in edit mode
    self.cityTextField.hidden = self.inEditModeWhenButtonPressed;
    self.stateTextField.hidden = self.inEditModeWhenButtonPressed;

    self.inEditModeWhenButtonPressed = !self.inEditModeWhenButtonPressed;
}

- (IBAction)onTitleChangeButtonTapped:(id)sender
{
    [self.delegate changeTitle:self.cityLabel.text];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WikiViewController *wvc = segue.destinationViewController;
    wvc.wikiURL = [NSString stringWithFormat: @"http://en.wikipedia.org/wiki/%@", [self.selectedCity getName]];
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
{
}

@end

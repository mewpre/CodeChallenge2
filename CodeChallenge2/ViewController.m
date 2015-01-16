//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Yi-Chin Sun on 1/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "City.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate>

@property NSMutableArray *citiesArray;
@property (strong, nonatomic) IBOutlet UITableView *cityTableView;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationTitle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.citiesArray = [[NSMutableArray alloc] init];
    [self.citiesArray addObject:[[City alloc] initWithName: @"Nashville"
                                                     state: @"TN"
                                                     image: [UIImage imageNamed: @"NV"]]];
    [self.citiesArray addObject:[[City alloc] initWithName: @"New York City"
                                                     state: @"NY"
                                                     image: [UIImage imageNamed: @"NYC"]]];
    [self.citiesArray addObject:[[City alloc] initWithName: @"St. Louis"
                                                     state: @"MO"
                                                     image: [UIImage imageNamed: @"STL"]]];
    [self.citiesArray addObject:[[City alloc] initWithName: @"San Francisco"
                                                     state: @"CA"
                                                     image: [UIImage imageNamed: @"SF"]]];
                                 }

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    City *city = [self.citiesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [city getName];
    cell.detailTextLabel.text = [city getState];
    cell.imageView.image = [city getImage];

    return cell;
}

//Method to enable built-in edit functionality
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//Built-in Method for clicking on delete button
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.cityTableView beginUpdates];
    //must put deleteRowsAtIndexPaths between table view beginUpdates and endUpdates methods
    [self.cityTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.citiesArray removeObjectAtIndex:indexPath.row];
    [self.cityTableView reloadData];
    [self.cityTableView endUpdates];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.citiesArray.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    DetailViewController *dvc = segue.destinationViewController;
    dvc.selectedCity = [self.citiesArray objectAtIndex:[[self.cityTableView indexPathForCell:cell] row]];
    dvc.delegate = self;

}

-(void)changeTitle:(NSString *)newTitle
{
    self.navigationTitle.title = newTitle;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.cityTableView reloadData];
}

@end

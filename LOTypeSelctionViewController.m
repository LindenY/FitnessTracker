//
//  LOTypeSelctionViewController.m
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOTypeSelctionViewController.h"
#import "LOHistoryTableViewController.h"
#import "LOStartingViewController.h"
#import "LOFitnessType.h"
#import "LOGenericType.h"

@interface LOTypeSelctionViewController ()

@end

@implementation LOTypeSelctionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.navigationItem setTitle:@"Fitness Type"];
        
        UIImage * rightButtonIcon = [UIImage imageNamed:@"chart-bar-outline"];
        UIImage * leftButtonIcon = [UIImage imageNamed:@"user"];
        
        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonIcon style:UIBarButtonItemStyleBordered target:self action:@selector(historyView)];
        UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonIcon style:UIBarButtonItemStyleBordered target:self action:@selector(profileView)];
        
        [self.navigationItem setRightBarButtonItem:rightButton];
        [self.navigationItem setLeftBarButtonItem:leftButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [LOFitnessType shareFitnessType].types.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    LOGenericType * type = [[LOFitnessType shareFitnessType].types objectAtIndex:indexPath.row];
    [cell.textLabel setText:type.name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LOGenericType * type = [[LOFitnessType shareFitnessType].types objectAtIndex:indexPath.row];
    UIViewController * controller = [type controller];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)historyView
{
    if (!self.htvc) {
        self.htvc = [[LOHistoryTableViewController alloc] init];
    }
    [self.navigationController pushViewController:self.htvc animated:YES];
}

- (void)profileView
{
    LOStartingViewController * svc = [[LOStartingViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

@end

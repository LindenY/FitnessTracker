//
//  LOSummaryViewController.m
//  Fitness
//
//  Created by Desmond Lin on 3/14/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOSummaryViewController.h"
#import "LOUser.h"
#import "LOHistoryTableViewController.h"
#import "LOTypeSelctionViewController.h"

@interface LOSummaryViewController ()

@end

@implementation LOSummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.navigationItem setTitle:@"Summary"];
    }
    return self;
}

- (id)initWithModel:(LOGenericType *)m
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        self.model = m;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.headerLabel setText:[NSString stringWithFormat:@"Congrats %@, you have burned", [LOUser shareUser].name]];
    [self.calorieLabel setText:[NSString stringWithFormat:@"%.2lf", self.model.calorie]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moreFitness:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)histroy:(id)sender {
    UINavigationController * pvc = (UINavigationController *) self.presentingViewController;
    LOTypeSelctionViewController * tsvc = (LOTypeSelctionViewController *) [[pvc viewControllers] objectAtIndex:0];
    [pvc dismissViewControllerAnimated:YES completion:^(void){
        [tsvc historyView];
    }];
}
@end

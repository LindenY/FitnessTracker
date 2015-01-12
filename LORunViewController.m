//
//  LORunViewController.m
//  Fitness
//
//  Created by Desmond Lin on 3/14/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LORunViewController.h"
#import "LOSummaryViewController.h"

@interface LORunViewController ()

@end

@implementation LORunViewController
@synthesize model;
@synthesize timePicker, distanceTextField, restTextField, unitSegmentedController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.navigationItem setTitle:@"Run"];
        UITapGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignAllFirstResponder)];
        [self.view addGestureRecognizer:tapRecognizer];
    }
    return self;
}

- (id)initWithModel:(LORun *)m
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        [self setModel:m];;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.distanceTextField setDelegate:self];
    [self.restTextField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateCalorie:(id)sender {
    self.model.distance = [self distanceInMeter];
    self.model.duration = self.timePicker.countDownDuration;
    [self.model insertRecord];
    
    LOSummaryViewController * svc = [[LOSummaryViewController alloc] initWithModel:self.model];
    [self.navigationController presentViewController:svc animated:YES completion:^(void) {
        NSMutableArray * vca = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [vca removeObject:self];
        [self.navigationController setViewControllers:vca];
    }];
}

- (double)distanceInMeter
{
    double d = self.distanceTextField.text.doubleValue;
    switch (self.unitSegmentedController.selectedSegmentIndex) {
        case 0:
            d *= 1609.344;
            break;
        case 1:
            d *= 1000;
            break;
        default:
            break;
    }
    return d;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.restTextField) {
        [UIView animateWithDuration:0.5 animations:^(void) {
            CGRect rect = CGRectMake(0, -220, self.view.bounds.size.width, self.view.bounds.size.height);
            [self.view setFrame:rect];
        }];
    }
}

- (void)resignAllFirstResponder
{
    [self.distanceTextField resignFirstResponder];
    [self.restTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.5 animations:^(void) {
        CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view setFrame:rect];
    }];
}
@end

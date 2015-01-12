//
//  LOStartingViewController.m
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOStartingViewController.h"
#import "LOUser.h"
#import "LOTypeSelctionViewController.h"

@interface LOStartingViewController ()

@end

@implementation LOStartingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITapGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignAllFirstResponder)];
        [self.view addGestureRecognizer:tapRecognizer];
        
        [self.navigationItem setTitle:@"Profile"];
        
        if ([LOUser shareUser].archivedFromFile) {
            [self.nameTextField setText:[LOUser shareUser].name];
            [self.heightTextField setText:[NSString stringWithFormat:@"%.2lf", [LOUser shareUser].height]];
            [self.weightTextField setText:[NSString stringWithFormat:@"%.2lf", [LOUser shareUser].weight]];
            [self.ageTextField setText:[NSString stringWithFormat:@"%i", [LOUser shareUser].age]];
            [self.genderSegmentedController setSelectedSegmentIndex:[LOUser shareUser].gender];
            [self.heartrate20TextField setText:[NSString stringWithFormat:@"%i", [LOUser shareUser].heartrate20]];
            [self.button setHidden:YES];
        }else{
            [self.saveButton setHidden:YES];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.nameTextField setDelegate:self];
    [self.ageTextField setDelegate:self];
    [self.heightTextField setDelegate:self];
    [self.weightTextField setDelegate:self];
    [self.heartrate20TextField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender
{
    [self saveProfile];
}

- (IBAction)save:(id)sender
{
    [self saveProfile];
}

- (void)saveProfile
{
    if (self.validateName && self.validateHeight && self.validateWeight && self.validateAge && self.validateHeartrate20) {
        [LOUser shareUser].gender = self.genderSegmentedController.selectedSegmentIndex;
        LOTypeSelctionViewController * tsvc = [[LOTypeSelctionViewController alloc] init];
        UINavigationController * nc = [[UINavigationController alloc] initWithRootViewController:tsvc];
        [[LOUser shareUser] save];
        [self presentViewController:nc animated:YES completion:nil];
    }
}

- (BOOL)validateName
{
    if (![self.nameTextField.text isEqual: @""]) {
        self.nameTextField.backgroundColor = [UIColor clearColor];
        [LOUser shareUser].name = self.nameTextField.text;
        return YES;
    }
    self.nameTextField.backgroundColor = [UIColor redColor];
    [self.nameTextField setPlaceholder:@"Name can not be empty."];
    return NO;
}

- (BOOL)validateHeight
{
    double height = self.heightTextField.text.doubleValue;
    if (height > 0 && height < 300) {
        self.heightTextField.backgroundColor = [UIColor clearColor];
        [LOUser shareUser].height = height;
        return YES;
    }
    self.heightTextField.backgroundColor = [UIColor redColor];
    [self.heightTextField setText:@""];
    return NO;
}

- (BOOL)validateWeight
{
    double weight = self.weightTextField.text.doubleValue;
    if (weight > 0 && weight < 300) {
        self.weightTextField.backgroundColor = [UIColor clearColor];
        [LOUser shareUser].weight = weight;
        return YES;
    }
    self.weightTextField.backgroundColor = [UIColor redColor];
    [self.weightTextField setText:@""];
    return NO;
}

- (BOOL)validateAge
{
    int age = self.ageTextField.text.intValue;
    if (age > 0 && age < 100) {
        self.ageTextField.backgroundColor = [UIColor clearColor];
        [LOUser shareUser].age = age;
        return YES;
    }
    self.ageTextField.backgroundColor = [UIColor redColor];
    [self.ageTextField setText:@""];
    return NO;
}

- (BOOL)validateHeartrate20
{
    int heartrate20 = self.heartrate20TextField.text.intValue;
    if (heartrate20 > 0) {
        self.ageTextField.backgroundColor = [UIColor clearColor];
        [LOUser shareUser].heartrate20 = heartrate20;
        return YES;
    }
    self.ageTextField.backgroundColor = [UIColor redColor];
    [self.heartrate20TextField setText:@""];
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect rect = self.view.frame;
    if (textField == self.heartrate20TextField) {
        rect.origin.y = -120;
        [UIView animateWithDuration:0.3 animations:^(void){
            [self.view setFrame:rect];
        }];
        return;
    }
    rect.origin.y = 0;
    [UIView animateWithDuration:0.3 animations:^(void){
        [self.view setFrame:rect];
    }];
}

- (void)resignAllFirstResponder
{
    [self.nameTextField resignFirstResponder];
    [self.heightTextField resignFirstResponder];
    [self.weightTextField resignFirstResponder];
    [self.ageTextField resignFirstResponder];
    [self.heartrate20TextField resignFirstResponder];
}


@end

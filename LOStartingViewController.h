//
//  LOStartingViewController.h
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOStartingViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (weak, nonatomic) IBOutlet UITextField *heartrate20TextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentedController;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)start:(id)sender;
- (IBAction)save:(id)sender;

- (BOOL)validateName;
- (BOOL)validateHeight;
- (BOOL)validateWeight;
- (BOOL)validateAge;
- (BOOL)validateHeartrate20;
- (void)resignAllFirstResponder;
- (void)saveProfile;

@end

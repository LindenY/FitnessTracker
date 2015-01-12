//
//  LORunViewController.h
//  Fitness
//
//  Created by Desmond Lin on 3/14/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LORun.h"

@interface LORunViewController : UIViewController <UITextFieldDelegate>

- (id)initWithModel:(LORun *)m;

@property (nonatomic, strong) LORun * model;

@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UITextField *restTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSegmentedController;

- (IBAction)calculateCalorie:(id)sender;
- (double)distanceInMeter;
- (void)resignAllFirstResponder;

@end

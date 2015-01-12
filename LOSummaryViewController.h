//
//  LOSummaryViewController.h
//  Fitness
//
//  Created by Desmond Lin on 3/14/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOGenericType.h"

@interface LOSummaryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *calorieLabel;
@property (nonatomic, strong) LOGenericType * model;


- (id)initWithModel:(LOGenericType *)m;
- (IBAction)moreFitness:(id)sender;
- (IBAction)histroy:(id)sender;


@end

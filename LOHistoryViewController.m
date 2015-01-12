//
//  LOHistoryViewController.m
//  Fitness
//
//  Created by Desmond Lin on 3/15/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOHistoryViewController.h"
#import "LODailyTypeCalorieDao.h"
#import "DailyTypeCalorie.h"

@interface LOHistoryViewController ()

@end

@implementation LOHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray * records = [LODailyTypeCalorieDao findAllOnDate:[NSDate date]];
    for (DailyTypeCalorie * dtc in records) {
        NSLog(@"Date: %@; Type: %@; Calorie:%@", dtc.date, dtc.type, dtc.calorie);
    }
    
    NSLog(@"Caloire In Total: %f", [LODailyTypeCalorieDao findCalorieOnDate:[NSDate date]]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  LOTypeSelctionViewController.h
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOHistoryTableViewController.h"

@interface LOTypeSelctionViewController : UITableViewController

@property (nonatomic, strong) LOHistoryTableViewController * htvc;

- (void)historyView;
- (void)profileView;

@end

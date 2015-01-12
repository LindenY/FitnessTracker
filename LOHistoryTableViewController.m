//
//  LOHistoryTableViewController.m
//  Fitness
//
//  Created by Desmond Lin on 3/15/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOHistoryTableViewController.h"
#import "LODailyCell.h"
#import "LODailyTypeCalorieDao.h"

@interface LOHistoryTableViewController ()

@end

@implementation LOHistoryTableViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.maxCalorie = [LODailyTypeCalorieDao findMaxMonthBeforeDate:[NSDate date]];
        
        if (self.maxCalorie <= 0) {
            self.maxCalorie = 1;
        }
        
        [self.navigationItem setTitle:@"History"];
    };
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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
    static NSDate * ed = nil;
    
    if (!ed) {
        ed = [LODailyTypeCalorieDao findEarliestDate];
        if (!ed) {
            ed = [NSDate date];
        }
        
        NSDateComponents * component = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:ed];
        ed = [[NSCalendar currentCalendar] dateFromComponents:component];
        
        NSDateComponents * difference = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:ed toDate:[NSDate date] options:0];
        self.numberOfRows = [difference day] + 1;
    }
    
    return self.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LODailyCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[LODailyCell alloc] init];
    }
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
    components.day -= indexPath.row;
    NSDate * d = [calendar dateFromComponents:components];
    
    [cell setDate:d];
    double tc = [LODailyTypeCalorieDao findCalorieOnDate:d];
    [cell setCalorie:tc];
    [cell setPrecentage:tc / self.maxCalorie];
    
    if (indexPath.row == 0) {
        [cell setLineIcon:LineHead];
    } else if (indexPath.row == self.numberOfRows-1) {
        [cell setLineIcon:LineTail];
    } else {
        [cell setLineIcon:LineMid];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

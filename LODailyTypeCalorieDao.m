//
//  LODailyTypeCalorieDao.m
//  Fitness
//
//  Created by Desmond Lin on 3/15/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LODailyTypeCalorieDao.h"
#import "LODataStore.h"
#import "DailyTypeCalorie.h"

@implementation LODailyTypeCalorieDao

+ (NSArray *)findAllOnDate:(NSDate *)date
{
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"DailyTypeCalorie" inManagedObjectContext:[LODataStore shareStore].managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    
    NSDate * startingDate = [calendar dateFromComponents:components];
    components.day += 1;
    NSDate * endingDate = [calendar dateFromComponents:components];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(date <= %@) AND (date >= %@)", endingDate, startingDate];
    [fetchRequest setPredicate:predicate];
    
    NSError * error;
    NSArray * records = [[LODataStore shareStore].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error != nil) {
        NSLog(@"Error: %@", error);
    }
    return records;
}

+ (double)findCalorieOnDate:(NSDate *)date
{
    NSArray * records = [LODailyTypeCalorieDao findAllOnDate:date];
    double calorieInTotal = 0;
    
    for (DailyTypeCalorie * dtc in records) {
        NSNumber * cn = dtc.calorie;
        calorieInTotal += cn.doubleValue;
    }
    return calorieInTotal;
}

+ (double)findMaxMonthBeforeDate:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    double maxTc = 0;
    
    for (int i=0; i<30; i++) {
        NSDate * d = [calendar dateFromComponents:components];
        double tc = [LODailyTypeCalorieDao findCalorieOnDate:d];
        if (tc > maxTc) {
            maxTc = tc;
        }
        components.day -= 1;
    }
    return maxTc;
}

+ (NSDate *)findEarliestDate
{
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"DailyTypeCalorie" inManagedObjectContext:[LODataStore shareStore].managedObjectContext];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    
    NSError * error;
    NSArray * results = [[LODataStore shareStore].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error != nil) {
        NSLog(@"Error: %@", error);
    }
    
    NSDate * ed = [results valueForKeyPath:@"@min.date"];
    return ed;
}

@end

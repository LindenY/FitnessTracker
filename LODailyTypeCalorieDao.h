//
//  LODailyTypeCalorieDao.h
//  Fitness
//
//  Created by Desmond Lin on 3/15/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LODailyTypeCalorieDao : NSObject

+ (NSDate *)findEarliestDate;
+ (NSArray *)findAllOnDate:(NSDate *)date;
+ (double)findCalorieOnDate:(NSDate *)date;
+ (double)findMaxMonthBeforeDate:(NSDate *)date;

@end

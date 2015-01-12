//
//  DailyTypeCalorie.h
//  Fitness
//
//  Created by Desmond Lin on 3/15/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DailyTypeCalorie : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * calorie;
@property (nonatomic, retain) NSDate * date;

@end

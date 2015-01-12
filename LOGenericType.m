//
//  LOGenericType.m
//  Fitness
//
//  Created by Desmond Lin on 3/13/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOGenericType.h"
#import "LODataStore.h"
#import "LOUser.h"
#import "DailyTypeCalorie.h"

@implementation LOGenericType
@synthesize name, distance, duration;

- (UIViewController *)controller
{
    return nil;
}

- (double)calorie
{
    NSLog(@"CalculateCalore");
    int ahr = [self averageHeartrate];
    double weight = [LOUser shareUser].weight;
    int age = [LOUser shareUser].age;
    double vo2max = [[LOUser shareUser] vo2max];
    double cph = 0;
    if ([LOUser shareUser].gender == 0) {
        cph = (-59.3954 + (0.45 * ahr) + (0.380 * vo2max) + (0.103 * weight) + (0.274 * age)) / 4.184;
    }else{
        cph = (-95.7735 + (0.634 * ahr) + (0.404 * vo2max) + (0.394 * weight) + (0.271 * age)) / 4.184;
    }
    
    NSLog(@"ahr: %i; weight: %f; age: %i; vo2max: %f; cph: %f; duration: %f", ahr, weight, age, vo2max, cph, duration);
    return cph * 60 * duration / 3600;
}

- (double)averageSpeed
{
    return self.distance / self.duration;
}

- (int)averageHeartrate
{
    if (_averageHeartrate >= 0) {
        return _averageHeartrate;
    }
    
    return ([LOUser shareUser].maxHeartrate - [LOUser shareUser].restHeartrate) / 2 + [LOUser shareUser].restHeartrate;
}

- (BOOL)insertRecord
{
    NSManagedObjectContext * moc = [LODataStore shareStore].managedObjectContext;
    DailyTypeCalorie * dtc = [NSEntityDescription insertNewObjectForEntityForName:@"DailyTypeCalorie" inManagedObjectContext:moc];
    dtc.date = [NSDate date];
    dtc.calorie = [NSNumber numberWithDouble:self.calorie];
    dtc.type = self.name;
    NSError * error;
    if (![moc save:&error]) {
        NSLog(@"Save Daily Type Calorie Failed");
        return NO;
    }
    return YES;
}

@end

//
//  LOFitnessType.m
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOFitnessType.h"
#import "LORun.h"
#import "LOSwim.h"
#import "LOBike.h"

@implementation LOFitnessType

+ (LOFitnessType *)shareFitnessType
{
    LOFitnessType * shareFitnessType = nil;
    if (!shareFitnessType) {
        shareFitnessType = [[super alloc] init];
    }
    return shareFitnessType;
}

+ (id)alloc
{
    return [self shareFitnessType];
}

- (NSArray *)types
{
    static NSArray * t = nil;
    if (!t) {
        LORun * run = [[LORun alloc] init];
        LOSwim * swim = [[LOSwim alloc] init];
        LOBike * bike = [[LOBike alloc] init];
        t = [NSArray arrayWithObjects:run, swim, bike, nil];
    }
    return t;
}

@end

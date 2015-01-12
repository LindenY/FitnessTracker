//
//  LORun.m
//  Fitness
//
//  Created by Desmond Lin on 3/13/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LORun.h"
#import "LOUser.h"
#import "LORunViewController.h"

@implementation LORun
@synthesize averageHeartrate = _averageHeartrate;

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Run";
    }
    return self;
}

- (UIViewController *)controller
{
    return [[LORunViewController alloc] initWithModel:self];
}

- (int)averageHeartrate
{
    if (_averageHeartrate > 0) {
        return _averageHeartrate;
    }
    NSLog(@"intensity: %f", [self intensity]);
    NSLog(@"averageHeartrate: %f", ([LOUser shareUser].maxHeartrate - [LOUser shareUser].restHeartrate) * [self intensity] + [LOUser shareUser].restHeartrate);
    return ([LOUser shareUser].maxHeartrate - [LOUser shareUser].restHeartrate) * [self intensity] + [LOUser shareUser].restHeartrate;
}

- (double)intensity
{
    int age = [LOUser shareUser].age;
    if (age < 20) {
        age = 20;
    }else if (age > 70) {
        age = 70;
    }
    
    double bs = - 0.005 * [LOUser shareUser].age + 1.6;
    double us = - 0.027 * [LOUser shareUser].age + 7.25;
    
    double k = (1 - 0.1) / (us - bs);
    double b = 1 - k * us;
    
    double as  = self.averageSpeed;
    if (as < bs) {
        as = bs;
    }else if (as > us){
        as = us;
    }
    
    double i = k * self.averageSpeed + b;
    
    if (i < 0.5) {
        i = 0.5;
    }else if (i > 1) {
        i = 1;
    }
    
    
    return i;
}


@end

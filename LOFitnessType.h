//
//  LOFitnessType.h
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOFitnessType : NSObject

@property (nonatomic, strong) NSArray * types;

+ (LOFitnessType *)shareFitnessType;

@end

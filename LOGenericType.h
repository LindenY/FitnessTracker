//
//  LOGenericType.h
//  Fitness
//
//  Created by Desmond Lin on 3/13/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LOGenericTypeProtocol.h"

@interface LOGenericType : NSObject <LOGenericTypeProtocol>

@property (nonatomic, strong) NSString * name;
@property (nonatomic) double distance;
@property (nonatomic) double duration;
@property (nonatomic) double temperature;
@property (nonatomic) int averageHeartrate;
@property (nonatomic, readonly) double calorie;
@property (nonatomic, readonly) double averageSpeed;

- (BOOL)insertRecord;

@end

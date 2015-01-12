//
//  LOUser.h
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOUser : NSObject <NSCoding>

@property (nonatomic, strong) NSString * name;
@property (nonatomic) double height;
@property (nonatomic) double weight;
@property (nonatomic) int age;
@property (nonatomic) int gender;
@property (nonatomic) int heartrate20;
@property (nonatomic, readonly) double vo2max;
@property (nonatomic, readonly) int restHeartrate;
@property (nonatomic, readonly) int maxHeartrate;

@property (nonatomic) BOOL archivedFromFile;

+(LOUser *)shareUser;
+ (NSString *)archivePath;

-(BOOL)save;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (id)initWithCoder:(NSCoder *)aDecoder;


@end

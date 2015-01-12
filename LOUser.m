//
//  LOUser.m
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOUser.h"

@implementation LOUser
@synthesize name, height, weight, age, gender, heartrate20;

+ (LOUser *)shareUser
{
    static LOUser * shareUser = nil;
    if (!shareUser) {
        shareUser = [NSKeyedUnarchiver unarchiveObjectWithFile:[LOUser archivePath]];
        if (!shareUser) {
            shareUser = [[super alloc] init];
            shareUser.archivedFromFile = NO;
        }else{
            shareUser.archivedFromFile = YES;
        }
    }
    return shareUser;
}

- (double)vo2max
{
    return 15.3 * (self.maxHeartrate / self.restHeartrate);
}

- (int)maxHeartrate
{
    if (self.gender == 0) {
        return 216 - 1.09 * self.age;
    }
    return 202 - 0.55 * self.age;
}

- (int)restHeartrate
{
    return self.heartrate20 * 3;
}

+ (id)alloc
{
    return [self shareUser];
}

+ (NSString *)archivePath
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString * documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingString:@"user.archive"];
}

- (BOOL)save
{
    return [NSKeyedArchiver archiveRootObject:self toFile:[LOUser archivePath]];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeDouble:self.height forKey:@"height"];
    [aCoder encodeDouble:self.weight forKey:@"weight"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeInteger:self.gender forKey:@"gender"];
    [aCoder encodeInteger:self.heartrate20 forKey:@"heartrate20"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.height = [aDecoder decodeDoubleForKey:@"height"];
        self.weight = [aDecoder decodeDoubleForKey:@"weight"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.gender = [aDecoder decodeIntegerForKey:@"gender"];
        self.heartrate20 = [aDecoder decodeIntegerForKey:@"heartrate20"];
    }
    return self;
}

@end

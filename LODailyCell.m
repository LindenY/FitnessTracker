//
//  LODailyCell.m
//  Fitness
//
//  Created by Desmond Lin on 3/15/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LODailyCell.h"

@implementation LODailyCell
@synthesize dateLabel, iconView, barView, calorieLabel, lineView;

- (id)init
{
    self = [super init];
    if (self) {
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 100, 20)];
        [dateLabel setFont:[UIFont systemFontOfSize:12]];
        [dateLabel setTextAlignment:NSTextAlignmentRight];
        
        calorieLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 47, 100, 20)];
        [calorieLabel setFont:[UIFont systemFontOfSize:12]];
        
        iconView = [[UIImageView alloc] initWithFrame:CGRectMake(78, 37, 32, 32)];
        
        barView = [[UIView alloc] initWithFrame:CGRectMake(130, 27, 1, 16)];
        [barView setBackgroundColor:[UIColor greenColor]];
        [barView.layer setCornerRadius:5];
        
        lineView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 0, 20, 82)];
        
        [self addSubview:dateLabel];
        [self addSubview:iconView];
        [self addSubview:barView];
        [self addSubview:calorieLabel];
        [self addSubview:lineView];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [self.dateLabel setText:[formatter stringFromDate:date]];
}

- (void)setCalorie:(double)calorie
{
    _calorie = calorie;
    [self.calorieLabel setText:[NSString stringWithFormat:@"%.2lf Cal", calorie]];
    [self setIcon];
}

- (void)setPrecentage:(double)precentage
{
    if (precentage > 1.2) {
        _precentage = 1.2;
    } else if (precentage <= 0){
    
        _precentage = 0.01;
    } else {
        _precentage = precentage;
    }
    CGRect rect = barView.frame;
    rect.size.width = 180 * _precentage;
    [barView setFrame:rect];
}

- (void)setIcon
{
    if (_calorie <= 150) {
        [self.iconView setImage:[self getNegativeIcon]];
        return;
    }
    if (_calorie <= 350) {
        [self.iconView setImage:[self getNatureIcon]];
        return;
    }
    if (_calorie > 350) {
        [self.iconView setImage:[self getPostiveIcon]];
        return;
    }
}

- (void)setLineIcon:(LineIconType)lineIconType
{
    switch (lineIconType) {
        case LineHead:
            [lineView setImage:[UIImage imageNamed:@"head"]];
            break;
        case LineMid:
            [lineView setImage:[UIImage imageNamed:@"mid"]];
            break;
        case LineTail:
            [lineView setImage:[UIImage imageNamed:@"tail"]];
            break;
        default:
            break;
    }
}

- (UIImage *)getPostiveIcon
{
    static NSArray * postiveIcons = nil;
    if (!postiveIcons) {
        postiveIcons = [NSArray arrayWithObjects:@"cool", @"grin", @"happy", @"smiley", @"wink", nil];
    }
    return [UIImage imageNamed:[postiveIcons objectAtIndex:arc4random() % 5]];
}

- (UIImage *)getNatureIcon
{
    static NSArray * natureIcons = nil;
    if (!natureIcons) {
        natureIcons = [NSArray arrayWithObjects:@"wonder", @"neutral", @"tongue", nil];
    }
    return [UIImage imageNamed:[natureIcons objectAtIndex:arc4random() % 3]];
}

- (UIImage *)getNegativeIcon
{
    static NSArray * negativeIcons = nil;
    if (!negativeIcons) {
        negativeIcons = [NSArray arrayWithObjects:@"shocked", @"angry", @"confused", @"evil", @"sad", nil];
    }
    return [UIImage imageNamed:[negativeIcons objectAtIndex:arc4random() % 5]];
}



@end

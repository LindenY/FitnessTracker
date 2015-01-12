//
//  LODailyCell.h
//  Fitness
//
//  Created by Desmond Lin on 3/15/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    LineHead,
    LineMid,
    LineTail
    
}LineIconType;

@interface LODailyCell : UITableViewCell


@property (nonatomic, strong) NSDate * date;
@property (nonatomic) double calorie;
@property (nonatomic) double precentage;
@property (nonatomic, strong) UILabel * dateLabel;
@property (nonatomic, strong) UILabel * calorieLabel;
@property (nonatomic, strong) UIImageView * iconView;
@property (nonatomic, strong) UIView * barView;
@property (nonatomic, strong) UIImageView * lineView;

- (void)setIcon;
- (void)setLineIcon:(LineIconType)lineIconType;
- (UIImage *)getPostiveIcon;
- (UIImage *)getNatureIcon;
- (UIImage *)getNegativeIcon;

@end

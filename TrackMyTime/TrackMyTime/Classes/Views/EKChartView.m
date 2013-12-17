//
//  EKChartView.m
//  TrackMyTime
//
//  Created by Evgeny Karkan on 15.12.13.
//  Copyright (c) 2013 EvgenyKarkan. All rights reserved.
//

#import "EKChartView.h"
#import "EKLayoutUtil.h"

static CGFloat const kEKPieRadius            = 120.0f;
static CGFloat const kEKPieLabelFontSize     = 14.0f;
static CGFloat const kEKPieLabelRadius       = 135.0f;
static CGFloat const kEKChartSideSize        = 320.0f;
static CGFloat const kEKChartCenterY         = 215.0f;

static NSString * const kEKActivityLabelText = @"Activity";
static NSString * const kEKTotalLabelText    = @"Total";


@implementation EKChartView;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
        self.backgroundColor = appBackground;
        
		self.chart = [[XYPieChart alloc] init];
		self.chart.pieRadius = kEKPieRadius;
		[self.chart setStartPieAngle:M_PI_2];
		[self.chart setUserInteractionEnabled:YES];
		[self.chart setShowPercentage:YES];
		[self.chart setPieBackgroundColor:[UIColor colorWithWhite:0.9f alpha:1.0f]];
		[self.chart setLabelFont:[UIFont fontWithName:kEKFont size:kEKPieLabelFontSize]];
		[self.chart setLabelColor:[UIColor blackColor]];
		[self.chart setShowLabel:YES];
		[self.chart setLabelRadius:kEKPieLabelRadius];
		[self addSubview:self.chart];
        
		self.activityTime = [[UILabel alloc] init];
		self.activityTime.font = [UIFont fontWithName:kEKFont size:17.0f];
		self.activityTime.textAlignment = NSTextAlignmentLeft;
		[self addSubview:self.activityTime];
        
        self.cirle = [[FHCircleView alloc] initWithDiameter:15.0f];
        [self addSubview:self.cirle];
        
        self.annotationFromTo = [[UILabel alloc] init];
        self.annotationFromTo.font = [UIFont fontWithName:kEKFont size:18.0f];
        self.annotationFromTo.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.annotationFromTo];

        self.activityName = [[UILabel alloc] init];
        self.activityName.font = [UIFont fontWithName:kEKFont size:17.0f];
        self.activityName.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.activityName];
        
        self.activity = [[UILabel alloc] init];
        self.activity.font = [UIFont fontWithName:kEKFont size:17.0f];
		self.activity.textAlignment = NSTextAlignmentRight;
        self.activity.text = kEKActivityLabelText;
        [self addSubview:self.activity];
        
        self.total = [[UILabel alloc] init];
        self.total.font = [UIFont fontWithName:kEKFont size:17.0f];
		self.total.textAlignment = NSTextAlignmentRight;
        self.total.text = kEKTotalLabelText;
        [self addSubview:self.total];
        
        self.totalTime = [[UILabel alloc] init];
        self.totalTime.font = [UIFont fontWithName:kEKFont size:17.0f];
		self.totalTime.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.totalTime];
    }
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
    self.chart.frame = CGRectMake(0.0f, 0.0f, kEKChartSideSize, kEKChartSideSize);
	[self.chart setPieCenter:CGPointMake(self.frame.size.width / 2, kEKChartCenterY)];
    [self.cirle setCenter:CGPointMake(160.0f, [EKLayoutUtil cirleCenterY])];
    
    self.activityName.frame     = CGRectMake(175.0f, [EKLayoutUtil activityNameLabelY], 125.0f, 20.0f);
    self.activityTime.frame     = CGRectMake(175.0f, [EKLayoutUtil timeLabelY], 130.0f, 20.0f);

    self.annotationFromTo.frame = CGRectMake(0.0f, 360.0f, self.frame.size.width, 30.0f);

    self.activity.frame         = CGRectMake(30.0f, [EKLayoutUtil activityLabelY], 105.0f, 30.0f);
    self.total.frame            = CGRectMake(30.0f, [EKLayoutUtil totalLabelY], 105.0f, 30.0f);

    self.totalTime.frame        = CGRectMake(152.0f, [EKLayoutUtil totalTimeLabelY], self.frame.size.width / 2, 30.0f);
}

@end

//
//  ThumbnailDetailView.m
//  Moodsic
//
//  Created by Gene Yoo on 10/24/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import "ThumbnailDetailView.h"
#import "Utils.h"

@implementation ThumbnailDetailView


-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        self.thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0,
                                                                                width, height)];
        self.thumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.thumbnailImageView.clipsToBounds = YES;
        [self addSubview:self.thumbnailImageView];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(width / 25.0, height / 1.24,
                                                                    width, height / 13.3)];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont fontWithName:@"Avenir-Book" size: 21];
        [self addSubview:self.titleLabel];

        self.dateImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width / 25.0, height / 1.1,
                                                                           height / 13.3, height / 13.3)];
        self.dateImageView.image = [[UIImage imageNamed:@"clock"]
                                    imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.dateImageView.tintColor = [UIColor whiteColor];
        [self addSubview:self.dateImageView];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(width / 9.375, height / 1.1,
                                                                   width, height / 13.3)];
        self.dateLabel.textAlignment = NSTextAlignmentLeft;
        self.dateLabel.textColor = [UIColor whiteColor];
        self.dateLabel.font = [UIFont fontWithName:@"Avenir" size: 11];
        [self addSubview:self.dateLabel];
        
        self.gradientView = [[UIView alloc] initWithFrame:CGRectMake(0.0, height / 2.0,
                                                                     width, height / 2.0)];
        self.gradientView.clipsToBounds = YES;
        UIColor *startColor = [[UIColor alloc] initWithWhite:0.0 alpha:0.0];
        UIColor *endColor = [[UIColor alloc] initWithWhite:0.0 alpha:0.6];
        NSArray *colors = [NSArray arrayWithObjects:(id)startColor.CGColor, (id)endColor.CGColor, nil];
        CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
        gradientLayer.colors = colors;
        gradientLayer.frame = self.gradientView.bounds;
        [self.gradientView.layer addSublayer:gradientLayer];
        [self.thumbnailImageView addSubview:self.gradientView];
    }
    return self;
}

@end

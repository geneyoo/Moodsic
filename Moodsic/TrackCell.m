//
//  TrackCell.m
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import "TrackCell.h"
#import "Utils.h"

@implementation TrackCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        if ([[UIScreen mainScreen] bounds].size.height <= 480) {
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(width * 0.075, width * 0.42,
                                                                        width, height)];
            self.artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(width * 0.075, width * 0.49,
                                                                         width, height)];
            self.thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width * 0.075, height * 0.04,
                                                                                    width * 0.85,  width * 0.85)];
        } else {
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(width * 0.05, width * 0.39,
                                                                        width, height)];
            self.artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(width * 0.05, width * 0.47,
                                                                         width, height)];
            self.thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width * 0.05, width * 0.05,
                                                                                    width * 0.9,  width * 0.9)];
        }
        
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [Utils fontForTrackTitleLabel];
        [self.contentView addSubview:self.titleLabel];

        self.artistLabel.textAlignment = NSTextAlignmentLeft;
        self.artistLabel.textColor = [[UIColor alloc] initWithWhite:0.6 alpha:1.0];
        self.artistLabel.font = [Utils fontForTrackArtistLabel];
        [self.contentView addSubview:self.artistLabel];
        
        self.thumbnailImageView.layer.borderColor = [UIColor blackColor].CGColor;
        self.thumbnailImageView.layer.borderWidth = 1.0;
        [self.contentView addSubview:self.thumbnailImageView];
    }
    return self;
}

@end
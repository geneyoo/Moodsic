//
//  Utils.m
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(UIFont *) fontForTrackArtistLabel {
    if ([[UIScreen mainScreen] bounds].size.height <= 480) {
        return [UIFont fontWithName:@"Avenir-Book" size: 9];
    } else {
        return [UIFont fontWithName:@"Avenir-Book" size: 11];
    }
}

+(UIFont *) fontForTrackTitleLabel {
    if ([[UIScreen mainScreen] bounds].size.height <= 480) {
        return [UIFont fontWithName:@"Avenir-Book" size: 11];
    } else {
        return [UIFont fontWithName:@"Avenir-Book" size: 14];
    }
}

+(UIColor *) lightFontColor {
    return [[UIColor alloc] initWithWhite:0.6 alpha:1.0];
}

+(UIColor *) rectButtonColor {
    return [UIColor blueColor];
}

+(CGFloat) screenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

+(CGFloat) screenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

@end

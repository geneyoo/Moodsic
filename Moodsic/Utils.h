//
//  Utils.h
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils: NSObject
/*! @brief Returns the font used for Artist Labels. */
+(UIFont *) fontForTrackArtistLabel;
/*! @brief Returns the font used for Title Labels. */
+(UIFont *) fontForTrackTitleLabel;
/*! @brief Returns a grayish color, used for descriptive text. */
+(UIColor *) lightFontColor;
/*! @brief Returns the blue color used for rectangular buttons. */
+(UIColor *) rectButtonColor;
/*! @brief Returns the screen's width. */
+(CGFloat) screenWidth;
/*! @brief Returns the screen's height. */
+(CGFloat) screenHeight;
@end
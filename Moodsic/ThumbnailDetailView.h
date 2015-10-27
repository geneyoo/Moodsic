//
//  ThumbnailDetailView.h
//  Moodsic
//
//  Created by Gene Yoo on 10/24/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import <UIKit/UIKit.h>
/*!
 @class ThumbnailDetailView
 
 @brief The ThumbnailDetailView class
 
 @discussion This class displays the thumbnail in high resolution, and has the
 track title, and release date. It is intended to be a subview for 
 SingleTrackViewController.
 */

@interface ThumbnailDetailView : UIView

/*! @brief The image view with the high resolution thumbnail. */
@property (nonatomic, strong) UIImageView *thumbnailImageView;
/*! @brief The label with the track's title. */
@property (nonatomic, strong) UILabel *titleLabel;
/*! @brief The image view with the date clock icon. */
@property (nonatomic, strong) UIImageView *dateImageView;
/*! @brief The label with the release date. */
@property (nonatomic, strong) UILabel *dateLabel;
/*! @brief The view with the gradient effect. */
@property (nonatomic, strong) UIView *gradientView;

@end

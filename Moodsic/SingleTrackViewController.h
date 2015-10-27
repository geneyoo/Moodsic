//
//  SingleTrackViewController.h
//  Moodsic
//
//  Created by Gene Yoo on 10/24/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ThumbnailDetailView.h"
#import "Track.h"

/*! 
 @class SingleTrackViewController
 
 @brief The SingleTrackViewController class
 
 @discussion This class shows the details of a specific Track, and features
 buying and previews
 */
@interface SingleTrackViewController : UIViewController

/*! @brief The label with the artist's name. */
@property (nonatomic, strong) UILabel *artistLabel;

/*! @brief The header label for the album. */
@property (nonatomic, strong) UILabel *albumLabel;
/*! @brief The label with the album title. */
@property (nonatomic, strong) UILabel *albumTitleLabel;
/*! @brief The image view with the album artwork. */
@property (nonatomic, strong) UIImageView *albumImageView;

/*! @brief The header label for the genre. */
@property (nonatomic, strong) UILabel *genreLabel;
/*! @brief The type of the genre. */
@property (nonatomic, strong) UILabel *genreTitleLabel;
/*! @brief The button that opens the iTunes page for the genre. */
@property (nonatomic, strong) UIButton *genreButton;

/*! @brief The view with the thumbnail, title, and release date. */
@property (nonatomic, strong) ThumbnailDetailView *thumbnailView;
/*! @brief The thumbnail image of the track. */
@property (nonatomic, strong) UIImage *thumbnailImage;

/*! @brief The play/pause button for the preview. */
@property (nonatomic, strong) UIButton *previewButton;
/*! @brief The label describing the preview button. */
@property (nonatomic, strong) UILabel *previewLabel;

/*! @brief The button that opens the iTunes page for the song. */
@property (nonatomic, strong) UIButton *buyButton;
/*! @brief The label describing the buy button. */
@property (nonatomic, strong) UILabel *buyLabel;

/*! @brief The AVPlauer that plays the preview. */
@property (nonatomic, strong) AVPlayer *player;
/*! @brief The Track object being displayed. */
@property (nonatomic, strong) Track *track;

@end

//
//  TrackCell.h
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Track.h"

/*! 
 @class TrackCell
 
 @brief The TrackCell class
 
 @discussion The cells for the TracksCollectionViewController, with relevant
 details about each track.
 */

@interface TrackCell : UICollectionViewCell
/*! @brief  The image view that contains the thumbail album artwork. */
@property (nonatomic, strong) UIImageView *thumbnailImageView;
/*! @brief  The label with the artist's name. */
@property (nonatomic, strong) UILabel *artistLabel;
/*! @brief  The label with the title of the song. */
@property (nonatomic, strong) UILabel *titleLabel;

- (id)initWithFrame:(CGRect)frame;

@end
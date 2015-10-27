//
//  TracksCollectionViewController.h
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Track.h"
#import "TrackCell.h"
#import "RSSFeed.h"

/*!
 @class TracksCollectionViewController
 
 @brief The TracksCollectionViewController class
 
 @discussion This class shows the top tracks from iTunes and allows users
 to select a specific track to find more information.
 */
@interface TracksCollectionViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/*! @brief The cache for the album images loaded in the collection view. */
@property (nonatomic, strong) NSCache *imageCache;
/*! @brief The data model that contains the tracks. */
@property (nonatomic, strong) NSMutableArray *tracks;
/*! @brief The api object that downloads the data. */
@property (nonatomic, strong) RSSFeed *rssFeed;

@end


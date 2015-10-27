//
//  Track.h
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! 
 @class Track
 
 @brief The Track class
 
 @discussion An object for a specifc Track, containing its details
 */

@interface Track : NSObject
/*! @brief The string representation of the thumbnail url */
@property NSString *thumbnailURL;
/*! @brief The name of the genre. */
@property NSString *genre;
/*! @brief The name of the album. */
@property NSString *albumName;
/*! @brief The name of the artist. */
@property NSString *artistName;
/*! @brief The title of the song. */
@property NSString *trackTitle;
/*! @brief The string representation of the price. */
@property NSString *price;
/*! @brief The string of the url to the genre page on iTunes. */
@property NSString *genreLink;
/*! @brief The string of the release date for the song. */
@property NSString *releaseDate;
/*! @brief The string of the url to the artist page on iTunes. */
@property NSString *artistLink;
/*! @brief The string of the url to the track page on iTunes. */
@property NSString *trackLink;
/*! @brief The string of the url to the streamable preview m4a file. */
@property NSString *previewLink;

/*! 
    @brief Create the Track from the supplied data dictionary.
 
    @return Track* The track created from the data.
 */
-(Track *)initWithData: (NSDictionary *)data;

@end

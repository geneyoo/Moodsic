//
//  RSSFeed.h
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

/*! 
    @class RSSFeed
    
    @brief The RSSFeed class
 
    @discussion The object that connects with the iTunes RSS Feed Generator
 */
@interface RSSFeed: NSObject

-(RSSFeed *) init;
/*! 
    @brief Loads the top songs from the iTunes RSS generator.
    
    @param completionBlock  The completion block which updates an NSMutableArray *result
 */
-(void) loadTopTracksWithCompletion:(void(^)(NSMutableArray *result))completionBlock;

@end
//
//  Track.m
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import "Track.h"


@interface Track()

@end

@implementation Track


-(Track *)initWithData: (NSDictionary *)data {
    self = [super init];
    
    NSArray *images = [data valueForKey:@"im:image"];
    NSDictionary *imgDict = [images objectAtIndex:2];
    self.thumbnailURL = (NSString *)[imgDict valueForKey:@"label"];
    
    NSArray *links = [data valueForKey:@"link"];
    NSDictionary *linkDict = [links objectAtIndex:1];
    self.previewLink = [(NSString *)[linkDict valueForKey:@"attributes"]
                                              valueForKey:@"href"];
    
    self.genre = [[(NSString*)[data valueForKey:@"category"]
                                    valueForKey:@"attributes"]
                                    valueForKey:@"term"];
    
    self.genreLink = [[(NSString*)[data valueForKey:@"category"]
                                        valueForKey:@"attributes"]
                                        valueForKey:@"scheme"];
    
    self.trackTitle = [(NSString*)[data valueForKey:@"im:name"]
                                        valueForKey:@"label"];
    
    self.artistName = [(NSString*)[data valueForKey:@"im:artist"]
                                        valueForKey:@"label"];
    
    self.artistLink = [[(NSString*)[data valueForKey:@"im:artist"]
                                        valueForKey:@"attributes"]
                                        valueForKey:@"href"];
    
    self.price = [(NSString*) [data valueForKey:@"im:price"]
                                    valueForKey:@"label"];
    
    self.trackLink = [(NSString*) [data valueForKey:@"id"]
                                        valueForKey:@"label"];
    
    self.releaseDate = [[(NSString*) [data valueForKey:@"im:releaseDate"]
                                           valueForKey:@"attributes"]
                                           valueForKey:@"label"];
    
    self.albumName = [[(NSString *) [data valueForKey:@"im:collection"]
                                          valueForKey:@"im:name"]
                                          valueForKey:@"label"];
    
    return self;
}

@end
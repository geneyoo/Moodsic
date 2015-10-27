//
//  RSSFeed.m
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import "RSSFeed.h"

@interface RSSFeed()

@end

@implementation RSSFeed

-(RSSFeed *) init {
    self = [super init];
    return self;
}


-(void) loadTopTracksWithCompletion:(void(^)(NSMutableArray *result))completionBlock {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSString *urlString = [[NSDictionary dictionaryWithContentsOfFile: path] valueForKey:@"iTunes RSS"];
    NSURL *tracksUrl = [[NSURL alloc] initWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:tracksUrl completionHandler:^(NSData *data,
                                                                                        NSURLResponse *response,
                                                                                        NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSMutableArray *tracks = [[NSMutableArray alloc] init];
            
            NSError *error;
            NSDictionary *feedDictionary = [[NSJSONSerialization JSONObjectWithData:data
                                                                             options: NSJSONReadingMutableContainers
                                                                               error: &error] valueForKey:@"feed"];

            NSMutableArray *entry = (NSMutableArray *)[feedDictionary objectForKey:@"entry"];
            for (NSDictionary *trackData in entry) {
                Track *track = [[Track alloc] initWithData:trackData];
                [tracks addObject:track];
            }
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    completionBlock(tracks);
                });
            });
        }
    }];
    [task resume];
}

@end
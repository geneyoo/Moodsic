//
//  TracksCollectionViewController.m
//  Moodsic
//
//  Created by Gene Yoo on 10/23/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import "TracksCollectionViewController.h"
#import "SingleTrackViewController.h"

@interface TracksCollectionViewController ()

@property UICollectionView *collectionView;

/*! @brief Sets the initial navgiation view elements. */
- (void)setInitialView;
/*! @brief This loads the tracks and reloads the view. */
- (void)didLoadTracks:(NSMutableArray *)tracks;
/*! @brief Asyncronously downloads the images for the cell at a specific indexPath. */
- (void)asyncLoadImageForTrack:(Track *)track withImageView:(UIImageView *)imageView atIndexPath:(NSIndexPath *) indexPath;

@end

@implementation TracksCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[TrackCell class] forCellWithReuseIdentifier:@"TrackCell"];
    self.collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:self.collectionView];

    self.imageCache = [[NSCache alloc] init];
    self.tracks = [[NSMutableArray alloc] init];
    [self setInitialView];
    
    self.rssFeed = [[RSSFeed alloc] init];
    [self.rssFeed loadTopTracksWithCompletion:^(NSMutableArray *result){
        [self didLoadTracks:result];
    }];
}

- (void)setInitialView {
    [[self.navigationController navigationBar] setTitleTextAttributes:@{
                    NSForegroundColorAttributeName: [UIColor blackColor],
                               NSFontAttributeName: [UIFont fontWithName:@"Avenir" size:20.0f]
                                                                        }];
    [self setTitle:@"Top Songs"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tracks.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TrackCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TrackCell"
                                                                forIndexPath:indexPath];
    Track *track = [self.tracks objectAtIndex:indexPath.row];
    UIImage *thumbnail = [self.imageCache objectForKey:indexPath];
    
    if (thumbnail) {
        cell.thumbnailImageView.image = thumbnail;
    } else {
        [self asyncLoadImageForTrack:track withImageView:[cell thumbnailImageView] atIndexPath:indexPath];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.artistLabel.text = track.artistName;
    cell.titleLabel.text = track.trackTitle;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SingleTrackViewController *singleController = [[SingleTrackViewController alloc] init];
    Track *track = [self.tracks objectAtIndex:indexPath.row];
    singleController.track = track;

    UIImage *thumbnail = [self.imageCache objectForKey:indexPath];
    singleController.thumbnailImage = thumbnail;
    
    [self.navigationController pushViewController:singleController animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width * 0.48;
    CGFloat height =[UIScreen mainScreen].bounds.size.height * 0.33;
    return CGSizeMake(width,height);
}

- (void)asyncLoadImageForTrack:(Track *)track withImageView:(UIImageView *)imageView atIndexPath:(NSIndexPath *) indexPath {
    NSURL *imageURL = [[NSURL alloc]initWithString:track.thumbnailURL];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:imageURL
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                if (error != nil) {
                    NSLog(@"%@", [error localizedDescription]);
                    imageView.backgroundColor = [UIColor grayColor];
                } else {
                    UIImage *thumbnail = [[UIImage alloc] initWithData:data];
                    [self.imageCache setObject:thumbnail forKey: indexPath];
                    
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            imageView.image = thumbnail;
                        });
                    });
                }
            }] resume];
}

-(void)didLoadTracks:(NSMutableArray *)tracks {
    self.tracks = [tracks copy];
    [self.collectionView reloadData];
}

@end

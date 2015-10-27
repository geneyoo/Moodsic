//
//  SingleTrackViewController.m
//  Moodsic
//
//  Created by Gene Yoo on 10/24/15.
//  Copyright © 2015 geneyoo. All rights reserved.
//

#import "SingleTrackViewController.h"
#import "Utils.h"

@interface SingleTrackViewController ()
@property (nonatomic, assign) BOOL songIsPlaying;

/*! @brief Allocates and loads the elements for the Album and Genre of the song. */
-(void)loadCategoryElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight;

/*! @brief Allocates and loads the elements for Buying the song. */
-(void)loadBuyElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight;

/*! @brief Allocates and loads the elements for thumbnail artwork. */
-(void)loadThumbnailElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight;

/*! @brief Allocates and loads the player that can play a preview of the song. */
-(void)loadPlayerElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight;

/*! @brief Allocates and create divides between sections of the view. */
-(void)drawDividers:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight;

@end

@implementation SingleTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;

    [self loadThumbnailElements:screenWidth andHeight:screenHeight];
    [self loadBuyElements:screenWidth andHeight:screenHeight];
    [self loadCategoryElements:screenWidth andHeight:screenHeight];
    [self loadPlayerElements:screenWidth andHeight:screenHeight];
    [self drawDividers:screenWidth andHeight:screenHeight];
}

- (void)loadThumbnailElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight {
    
    self.thumbnailView = [[ThumbnailDetailView alloc] initWithFrame: CGRectMake(0.0, 0.0, screenWidth, screenHeight * 0.4)];
    self.thumbnailView.dateImageView.tintColor = [UIColor whiteColor];
    self.thumbnailView.dateLabel.text = [NSString stringWithFormat:@"%@", self.track.releaseDate];
    self.thumbnailView.titleLabel.text= [NSString stringWithFormat:@"%@", self.track.trackTitle];
    [self.view addSubview:self.thumbnailView];
    
    self.albumImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth / 25.0, screenHeight / 1.65,
                                                                        screenWidth / 5.0, screenWidth / 5.0)];
    self.albumImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.albumImageView.layer.borderWidth = 1.0;
    self.albumImageView.layer.cornerRadius = self.albumImageView.frame.size.height / 2;
    self.albumImageView.layer.masksToBounds = NO;
    self.albumImageView.clipsToBounds = YES;
    self.albumImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.albumImageView];

    [self asyncLoadLargeImage];
    
    self.artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/25.0, self.thumbnailView.frame.size.height * 1.02,
                                                                 screenWidth * 0.75 , screenHeight / 22.2)];
    self.artistLabel.textAlignment = NSTextAlignmentLeft;
    self.artistLabel.font = [UIFont fontWithName:@"Avenir-Book" size: 16];
    self.artistLabel.text = [NSString stringWithFormat:@"by %@", self.track.artistName];
    self.artistLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.artistLabel];
}

- (void)loadBuyElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight{
    self.buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buyButton.frame = CGRectMake(screenWidth * 0.6, screenHeight*0.48,
                                      screenWidth * 0.22, screenHeight * 0.045);
    
    self.buyButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
    self.buyButton.layer.borderColor = [Utils rectButtonColor].CGColor;
    self.buyButton.layer.borderWidth = 1.0;
    self.buyButton.layer.cornerRadius = 5.0;
    self.buyButton.backgroundColor = [UIColor clearColor];
    [self.buyButton setTitle:[NSString stringWithFormat:@"%@", self.track.price]
                    forState:UIControlStateNormal];
    [self.buyButton setTitleColor:[Utils rectButtonColor] forState:UIControlStateNormal];
    [self.buyButton addTarget:self
                       action:@selector(openItunesForSong)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buyButton];
    
    self.buyLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth * 0.6, screenHeight * 0.526,
                                                              screenWidth * 0.16, screenWidth / 15.0)];
    self.buyLabel.textAlignment = NSTextAlignmentLeft;
    self.buyLabel.font = [UIFont fontWithName:@"Avenir" size: 14];
    self.buyLabel.text = @"Buy";
    self.buyLabel.textColor = [Utils lightFontColor];
    [self.view addSubview:self.buyLabel];
}

- (void)loadCategoryElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight {
    self.albumLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth / 3.75, screenHeight / 1.62,
                                                                screenWidth / 3.75, screenHeight * 0.06)];
    self.albumLabel.textAlignment = NSTextAlignmentLeft;
    self.albumLabel.textColor = [UIColor blackColor];
    self.albumLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
    self.albumLabel.text = @"Album";
    [self.view addSubview:self.albumLabel];
    
    self.albumTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/3.75, screenHeight / 1.51,
                                                                     screenWidth * 0.4, screenHeight * 0.06)];
    self.albumTitleLabel.textAlignment = NSTextAlignmentLeft;
    self.albumTitleLabel.textColor = [Utils lightFontColor];
    self.albumTitleLabel.font = [UIFont fontWithName:@"Avenir-Book" size:14];
    self.albumTitleLabel.text = self.track.albumName;
    self.albumTitleLabel.numberOfLines = 1;
    self.albumTitleLabel.minimumScaleFactor = 10./self.albumTitleLabel.font.pointSize;
    self.albumTitleLabel.adjustsFontSizeToFitWidth = YES;
    self.albumTitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.view addSubview:self.albumTitleLabel];
    
    self.genreLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth * 0.72, screenHeight / 1.62,
                                                                screenWidth / 3.75, screenHeight * 0.06)];
    self.genreLabel.textAlignment = NSTextAlignmentLeft;
    self.genreLabel.textColor = [UIColor blackColor];
    self.genreLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
    self.genreLabel.text = @"Genre";
    [self.view addSubview:self.genreLabel];
    
    self.genreTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth * 0.72, screenHeight / 1.51,
                                                                     screenWidth * 0.4, screenHeight * 0.06)];
    self.genreTitleLabel.textAlignment = NSTextAlignmentLeft;
    self.genreTitleLabel.textColor = [Utils lightFontColor];
    self.genreTitleLabel.font = [UIFont fontWithName:@"Avenir-Book" size:14];
    self.genreTitleLabel.text = self.track.genre;
    self.genreTitleLabel.numberOfLines = 1;
    self.genreTitleLabel.minimumScaleFactor = 8./self.genreTitleLabel.font.pointSize;
    self.genreTitleLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:self.genreTitleLabel];
    
    
    self.genreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.genreButton.frame = CGRectMake(0, 0, screenWidth / 2.0, screenHeight * 0.045);
    self.genreButton.center = CGPointMake(self.view.center.x, screenHeight / 1.25);
    self.genreButton.backgroundColor = [UIColor clearColor];
    self.genreButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Book" size:13];
    self.genreButton.titleLabel.numberOfLines = 1;
    self.genreButton.titleLabel.minimumScaleFactor = 8./self.genreButton.titleLabel.font.pointSize;
    self.genreButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.genreButton.layer.borderColor = [Utils rectButtonColor].CGColor;
    self.genreButton.layer.borderWidth = 1.0;
    self.genreButton.layer.cornerRadius = 5.0;
    [self.genreButton setTitle:[NSString stringWithFormat:@"More %@ in iTunes", self.track.genre]
                      forState:UIControlStateNormal];
    [self.genreButton setTitleColor:[Utils rectButtonColor] forState:UIControlStateNormal];
    [self.genreButton addTarget:self
                         action:@selector(openItunesForSong)
               forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.genreButton];
}


- (void)loadPlayerElements:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight {
    self.previewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.previewButton.frame = CGRectMake(screenWidth * 0.2, screenHeight * 0.48,
                                          screenWidth / 15.0, screenWidth / 15.0);
    UIImage *playImage = [[UIImage imageNamed:@"play"]
                          imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *pauseImage = [[UIImage imageNamed:@"pause"]
                           imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.previewButton setImage:playImage
                        forState:UIControlStateNormal];
    [self.previewButton setImage:pauseImage
                        forState:UIControlStateSelected];
    [self.previewButton addTarget:self
                           action:@selector(playPauseSong:)
                 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.previewButton];
    
    self.previewLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth * 0.2, screenHeight * 0.526,
                                                                  screenWidth * 0.16, screenWidth / 15.0)];
    self.previewLabel.textAlignment = NSTextAlignmentLeft;
    self.previewLabel.font = [UIFont fontWithName:@"Avenir" size: 14];
    self.previewLabel.text = @"Preview";
    self.previewLabel.textColor = [Utils lightFontColor];
    [self.view addSubview:self.previewLabel];
    
    NSURL *streamURL = [[NSURL alloc] initWithString:self.track.previewLink];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:streamURL];
    self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    self.songIsPlaying = NO;
}

- (void)drawDividers:(CGFloat)screenWidth andHeight:(CGFloat)screenHeight {
    CALayer *bottomborder = [CALayer layer];
    bottomborder.frame = CGRectMake(screenWidth*0.025, screenHeight/1.34, screenWidth*0.95, 1.0);
    bottomborder.backgroundColor = [Utils lightFontColor].CGColor;
    [self.view.layer addSublayer:bottomborder];
    
    CALayer *topborder = [CALayer layer];
    topborder.frame = CGRectMake(screenWidth*0.025, screenHeight/1.7, screenWidth*0.95, 1.0);
    topborder.backgroundColor = [Utils lightFontColor].CGColor;
    [self.view.layer addSublayer:topborder];
}

- (void)openItunesForSong {
    NSURL *songURL = [[NSURL alloc] initWithString:self.track.trackLink];
    [[UIApplication sharedApplication] openURL:songURL]; // Doesn't work in simulator, only on actual device
}

- (void)openItunesForGenre {
    NSURL *genreURL = [[NSURL alloc] initWithString:self.track.genreLink];
    [[UIApplication sharedApplication] openURL:genreURL];
}

- (void)playPauseSong:(UIButton *) sender {
    if (sender.selected) {
        [self.player pause];
    } else {
        [self.player seekToTime: self.player.currentTime];
        [self.player play];
    }
    sender.selected = !sender.selected;
}

- (void)asyncLoadLargeImage {
    NSString *largeImageURL = [self.track.thumbnailURL stringByReplacingOccurrencesOfString:@"170x170"
                                                                                 withString:@"500x500"];
    NSURL *imageURL = [[NSURL alloc]initWithString:largeImageURL];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:imageURL
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                if (error != nil) {
                    NSLog(@"%@", [error localizedDescription]);
                    self.thumbnailView.thumbnailImageView.backgroundColor = [UIColor grayColor];
                    self.albumImageView.backgroundColor = [UIColor grayColor];
                } else {
                    UIImage *thumbnail = [[UIImage alloc] initWithData:data];
                    
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            self.thumbnailView.thumbnailImageView.image = thumbnail;
                            self.albumImageView.image = thumbnail;
                        });
                    });
                }
            }] resume];
}

@end

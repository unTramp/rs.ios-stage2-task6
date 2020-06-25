//
//  ShowPictureViewController.m
//  Figures
//
//  Created by Andrey Dorofeev on 23/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "ShowPictureViewController.h"

@interface ShowPictureViewController ()
@property (nonatomic, strong) UIImageView* showImageView;
@property (nonatomic, strong) UIImage* myImage;
@end

@implementation ShowPictureViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.showImageView = [[UIImageView alloc] init];
    self.showImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.showImageView.clipsToBounds = true;
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.showImageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.showImageView.widthAnchor constraintEqualToConstant:UIScreen.mainScreen.bounds.size.width],
        [self.showImageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.showImageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.showImageView.heightAnchor constraintEqualToConstant:UIScreen.mainScreen.bounds.size.width]
    ]];
}

- (void)configureWithImage:(UIImage*)img {
    self.myImage = img;
}

- (void)viewWillAppear:(BOOL)animated {
    self.showImageView.image = self.myImage;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end

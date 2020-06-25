//
//  AboutViewCell.m
//  Figures
//
//  Created by Andrey Dorofeev on 25/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "AboutViewCell.h"

@implementation AboutViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupViews];
        [self setUpPortrait];
        [self setUpLandscape];
        [self deviceOrientation:[UIDevice currentDevice].orientation];
        
    }
    return self;
}

- (void)setupViews {
    self.appleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    [self addSubview:self.appleImageView];
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:self.nameLabel];
    self.modelLabel = [[UILabel alloc] init];
    [self addSubview:self.modelLabel];
    self.systemLabel = [[UILabel alloc] init];
    [self addSubview:self.systemLabel];
    
    [self portraitFont];
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] systemName]];
    self.modelLabel.text = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] model]];
    self.systemLabel.text = [NSString stringWithFormat:@"IOS %@",[[UIDevice currentDevice] systemVersion]];
    
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = false;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.modelLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.systemLabel.translatesAutoresizingMaskIntoConstraints = false;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(void) landscapeFont {
    [self.nameLabel setFont:[UIFont systemFontOfSize:12.0 weight:UIFontWeightMedium]];
    [self.modelLabel setFont:[UIFont systemFontOfSize:12.0 weight:UIFontWeightMedium]];
    [self.systemLabel setFont:[UIFont systemFontOfSize:12.0 weight:UIFontWeightMedium]];
}

-(void) portraitFont {
    [self.nameLabel setFont:[UIFont systemFontOfSize:24.0 weight:UIFontWeightMedium]];
    [self.modelLabel setFont:[UIFont systemFontOfSize:24.0 weight:UIFontWeightMedium]];
    [self.systemLabel setFont:[UIFont systemFontOfSize:24.0 weight:UIFontWeightMedium]];
}

- (void)deviceOrientation:(UIDeviceOrientation)orientation {
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            [self portraitFont];
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            NSLog(@"Portrait");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            [self portraitFont];
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            NSLog(@"Portrait");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            [self landscapeFont];
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            NSLog(@"Landscape");
            break;
            
        case UIDeviceOrientationLandscapeRight:
             [self landscapeFont];
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            NSLog(@"Landscape");
            break;
            
        default:
            break;
    }
}

- (void)setUpPortrait {
    self.portraitConstraints = @[
        [self.appleImageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:self.center.x / -2],
        [self.appleImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.appleImageView.heightAnchor constraintEqualToConstant:99],
        [self.appleImageView.widthAnchor constraintEqualToConstant:84],
        
        [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.appleImageView.trailingAnchor constant:20],
        [self.nameLabel.centerYAnchor constraintEqualToAnchor:self.appleImageView.topAnchor constant:self.appleImageView.frame.size.height / 5],
        [self.nameLabel.heightAnchor constraintEqualToConstant:20],
        [self.nameLabel.widthAnchor constraintEqualToConstant:120],
        
        [self.modelLabel.leadingAnchor constraintEqualToAnchor:self.appleImageView.trailingAnchor constant:20],
        [self.modelLabel.centerYAnchor constraintEqualToAnchor:self.appleImageView.topAnchor constant:self.appleImageView.frame.size.height / 2],
        [self.modelLabel.heightAnchor constraintEqualToConstant:20],
        [self.modelLabel.widthAnchor constraintEqualToConstant:120],
        
        [self.systemLabel.leadingAnchor constraintEqualToAnchor:self.appleImageView.trailingAnchor constant:20],
        [self.systemLabel.centerYAnchor constraintEqualToAnchor:self.appleImageView.topAnchor constant:self.appleImageView.frame.size.height / 5*4],
        [self.systemLabel.heightAnchor constraintEqualToConstant:20],
        [self.systemLabel.widthAnchor constraintEqualToConstant:120]
    ];
}

-(void)setUpLandscape {
    self.landscapeConstraints = @[
        [self.appleImageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:self.center.x / -2],
        [self.appleImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.appleImageView.heightAnchor constraintEqualToConstant:99 / 2],
        [self.appleImageView.widthAnchor constraintEqualToConstant:84 / 2],
        
        [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.appleImageView.trailingAnchor constant:20],
        [self.nameLabel.centerYAnchor constraintEqualToAnchor:self.appleImageView.topAnchor constant:self.appleImageView.frame.size.height / 5 / 2],
        [self.nameLabel.heightAnchor constraintEqualToConstant:20],
        [self.nameLabel.widthAnchor constraintEqualToConstant:120],
        
        [self.modelLabel.leadingAnchor constraintEqualToAnchor:self.appleImageView.trailingAnchor constant:20],
        [self.modelLabel.centerYAnchor constraintEqualToAnchor:self.appleImageView.topAnchor constant:self.appleImageView.frame.size.height / 2 / 2],
        [self.modelLabel.heightAnchor constraintEqualToConstant:20],
        [self.modelLabel.widthAnchor constraintEqualToConstant:120],
        
        [self.systemLabel.leadingAnchor constraintEqualToAnchor:self.appleImageView.trailingAnchor constant:20],
        [self.systemLabel.centerYAnchor constraintEqualToAnchor:self.appleImageView.topAnchor constant:self.appleImageView.frame.size.height / 5*4 / 2],
        [self.systemLabel.heightAnchor constraintEqualToConstant:20],
        [self.systemLabel.widthAnchor constraintEqualToConstant:120]
    ];
}

@end

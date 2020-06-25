//
//  ButtonsTableViewCell.m
//  Figures
//
//  Created by Andrey Dorofeev on 25/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "ButtonsTableViewCell.h"
#import "UIColor+ColorExtensions.h"

@implementation ButtonsTableViewCell

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

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupViews {
    self.cvButton = [[UIButton alloc] init];
    [self addSubview:self.cvButton];
    self.startButton = [[UIButton alloc] init];
    [self addSubview:self.startButton];
    
    [self.cvButton setTitle:@"Open Git CV" forState:UIControlStateNormal];
    [self.cvButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cvButton setTitleColor:[UIColor hex:@"0x101010"] forState:UIControlStateNormal];
    [self.cvButton.titleLabel setFont:[UIFont systemFontOfSize:20.0 weight:UIFontWeightBold]];
    self.cvButton.backgroundColor = [UIColor hex:@"0xF9CC78"];
    self.cvButton.layer.cornerRadius = 25;
    
    
    [self.startButton setTitle:@"Go to start" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor hex:@"0x101010"] forState:UIControlStateNormal];
    [self.startButton.titleLabel setFont:[UIFont systemFontOfSize:20.0 weight:UIFontWeightBold]];
    self.startButton.backgroundColor = [UIColor hex:@"0xEE686A"];
    self.startButton.layer.cornerRadius = 25;
    
    self.cvButton.translatesAutoresizingMaskIntoConstraints = false;
    self.startButton.translatesAutoresizingMaskIntoConstraints = false;
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (void)deviceOrientation:(UIDeviceOrientation)orientation {
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            break;
            
        case UIDeviceOrientationLandscapeRight:
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            break;
            
        default:
            break;
    }
}

- (void)setUpPortrait {
    self.portraitConstraints = @[
        [self.cvButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.cvButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-50],
        [self.cvButton.widthAnchor constraintEqualToConstant:self.frame.size.width / 5 * 4],
        [self.cvButton.heightAnchor constraintEqualToConstant:55],

        [self.startButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.startButton.topAnchor constraintEqualToAnchor:self.cvButton.bottomAnchor constant:20],
        [self.startButton.widthAnchor constraintEqualToConstant:self.frame.size.width / 5 * 4],
        [self.startButton.heightAnchor constraintEqualToConstant:55]
    ];
}

-(void) setUpLandscape {
    self.landscapeConstraints = @[
        [self.cvButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant: -self.frame.size.width / 5 * 3],
        [self.cvButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.cvButton.widthAnchor constraintEqualToConstant:self.frame.size.width / 5 * 4],
        [self.cvButton.heightAnchor constraintEqualToConstant:55],
        
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant: self.frame.size.width / 5 * 3],
        [self.startButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.startButton.widthAnchor constraintEqualToConstant:self.frame.size.width / 5 * 4],
        [self.startButton.heightAnchor constraintEqualToConstant:55]
    ];
}

@end

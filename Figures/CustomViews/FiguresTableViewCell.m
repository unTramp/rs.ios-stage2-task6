//
//  FiguresTableViewCell.m
//  Figures
//
//  Created by Andrey Dorofeev on 25/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "FiguresTableViewCell.h"

@implementation FiguresTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self animateFigures:true];
        [self setupPortrait];
        [self setupLandscape];
  
        self.myRectangle.translatesAutoresizingMaskIntoConstraints = false;
        self.myCircle.translatesAutoresizingMaskIntoConstraints = false;
        self.myTriangle.translatesAutoresizingMaskIntoConstraints = false;
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = UIColor.whiteColor;
    
    self.myCircle = [[UIView alloc] init];
    [self addSubview: self.myCircle];
    self.myCircle.backgroundColor = [UIColor hex:@"0xEE686A"];
    self.myCircle.layer.cornerRadius = 35;
    self.myCircle.clipsToBounds = YES;
    
    
    self.myRectangle = [[UIView alloc] init];
    [self addSubview: self.myRectangle];
    self.myRectangle.backgroundColor = [UIColor hex:@"0x29C2D1"];
    
    
    self.myTriangle = [[Triangle alloc] init];
    [self addSubview: self.myTriangle];
    self.myTriangle.backgroundColor = UIColor.clearColor;
}

- (void)deviceOrientation:(UIDeviceOrientation)orientation {
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            self.myCircle.layer.cornerRadius = 35;
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            NSLog(@"Portrait");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            self.myCircle.layer.cornerRadius = 35;
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            NSLog(@"Portrait");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            self.myCircle.layer.cornerRadius = 25;
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            NSLog(@"Landscape");
            break;
            
        case UIDeviceOrientationLandscapeRight:
            self.myCircle.layer.cornerRadius = 25;
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            NSLog(@"Landscape");
            break;
            
        default:
            break;
    }
}

- (void)setupPortrait {
    self.portraitConstraints = @[
        [self.myRectangle.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.myRectangle.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.myRectangle.widthAnchor constraintEqualToConstant:70],
        [self.myRectangle.heightAnchor constraintEqualToConstant:70],
        
        [self.myCircle.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.myCircle.trailingAnchor constraintEqualToAnchor:self.myRectangle.leadingAnchor constant: -20],
        [self.myCircle.widthAnchor constraintEqualToConstant:70],
        [self.myCircle.heightAnchor constraintEqualToConstant:70],
        
        [self.myTriangle.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.myTriangle.leadingAnchor constraintEqualToAnchor:self.myRectangle.trailingAnchor constant: 20],
        [self.myTriangle.widthAnchor constraintEqualToConstant:70],
        [self.myTriangle.heightAnchor constraintEqualToConstant:70]
    ];
}

- (void)setupLandscape {
    self.landscapeConstraints = @[
        [self.myRectangle.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.myRectangle.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.myRectangle.widthAnchor constraintEqualToConstant:50],
        [self.myRectangle.heightAnchor constraintEqualToConstant:50],
        
        [self.myCircle.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.myCircle.trailingAnchor constraintEqualToAnchor:self.myRectangle.leadingAnchor constant: -30],
        [self.myCircle.widthAnchor constraintEqualToConstant:50],
        [self.myCircle.heightAnchor constraintEqualToConstant:50],
        
        [self.myTriangle.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.myTriangle.leadingAnchor constraintEqualToAnchor:self.myRectangle.trailingAnchor constant: 30],
        [self.myTriangle.widthAnchor constraintEqualToConstant:50],
        [self.myTriangle.heightAnchor constraintEqualToConstant:50]
    ];
    
}

-(void)animateFigures:(BOOL) marker {
    [self setCircleAnimtions:marker];
    [self setRectangleAnimtions:marker];
    [self setTriangleAnimtions:marker];
}


- (void)setCircleAnimtions:(BOOL)marker {
    if (marker == true) {
        self.myCircle.transform = CGAffineTransformMakeScale(1, 1);
        [UIView animateWithDuration:2.0f delay:0.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            self.myCircle.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            [self setCircleAnimtions:false];
        }];
    } else {
        [UIView animateWithDuration:2.0f delay:0.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            self.myCircle.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            [self setCircleAnimtions:true];
        }];
    }
}
    
- (void)setRectangleAnimtions:(BOOL)marker {
    if (marker == true) {
        [UIView animateWithDuration:2.0f delay:0.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            self.myRectangle.transform = CGAffineTransformMakeTranslation(0.0, self.myRectangle.frame.size.width * 0.1);
        } completion:^(BOOL finished) {
            [self setRectangleAnimtions:false];
        }];
    } else {
        [UIView animateWithDuration:2.0f delay:0.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            self.myRectangle.transform = CGAffineTransformMakeTranslation(0.0, self.myRectangle.frame.size.width * -0.1);
        } completion:^(BOOL finished) {
            [self setRectangleAnimtions:true];
        }];
    }
}

- (void)setTriangleAnimtions:(BOOL)marker {
    if (marker == true) {
        [UIView animateWithDuration:2.0f delay:0.0f
                            options: UIViewAnimationOptionCurveLinear
                         animations:^{
            self.myTriangle.transform = CGAffineTransformMakeRotation(M_PI);
        } completion:^(BOOL finished) {
            [self setTriangleAnimtions:false];
        }];
    } else {
        [UIView animateWithDuration:2.0f delay:0.0f
                            options: UIViewAnimationOptionCurveLinear
                         animations:^{
            self.myTriangle.transform = CGAffineTransformMakeRotation(M_PI*2);
        } completion:^(BOOL finished) {
            [self setTriangleAnimtions:true];
        }];
    }
}

@end

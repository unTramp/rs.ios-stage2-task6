//
//  ViewController.m
//  Figures
//
//  Created by Andrey Dorofeev on 19/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "ViewController.h"
#import "Triangle.h"
#import "UIColor+ColorExtensions.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel* areYouReady;
@property (nonatomic, strong) UIView* myRectangle;
@property (nonatomic, strong) UIView* myCircle;
@property (nonatomic, strong) Triangle* myTriangle;
@property (nonatomic, strong) UIButton* startButton;
@property (nonatomic, strong) UITabBarController* tabBar;

@property (nonatomic, strong) NSArray* portraitConstraints;
@property (nonatomic, strong) NSArray* landscapeConstraints;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpFigures];
    [self animateFigures:true];
    
    self.areYouReady.translatesAutoresizingMaskIntoConstraints = NO;
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.myRectangle.translatesAutoresizingMaskIntoConstraints = NO;
    self.myCircle.translatesAutoresizingMaskIntoConstraints = NO;
    self.myTriangle.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.portraitConstraints = @[
        [self.areYouReady.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: self.view.frame.size.height / 5],
        [self.areYouReady.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.areYouReady.widthAnchor constraintEqualToConstant:self.view.bounds.size.width],
        [self.areYouReady.heightAnchor constraintEqualToConstant:44],
        
        [self.startButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-self.view.frame.size.height / 5],
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.startButton.widthAnchor constraintEqualToConstant:self.view.bounds.size.width / 5 * 4],
        [self.startButton.heightAnchor constraintEqualToConstant:55],
        
        [self.myRectangle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: self.view.frame.size.height / 3],
        [self.myRectangle.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.myRectangle.widthAnchor constraintEqualToConstant:70],
        [self.myRectangle.heightAnchor constraintEqualToConstant:70],
        
        [self.myCircle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: self.view.frame.size.height / 3],
        [self.myCircle.trailingAnchor constraintEqualToAnchor:self.myRectangle.leadingAnchor constant: -20],
        [self.myCircle.widthAnchor constraintEqualToConstant:70],
        [self.myCircle.heightAnchor constraintEqualToConstant:70],
        
        [self.myTriangle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: self.view.frame.size.height / 3],
        [self.myTriangle.leadingAnchor constraintEqualToAnchor:self.myRectangle.trailingAnchor constant: 20],
        [self.myTriangle.widthAnchor constraintEqualToConstant:70],
        [self.myTriangle.heightAnchor constraintEqualToConstant:70]
    ];
    
    [NSLayoutConstraint activateConstraints:self.portraitConstraints];
}

// Rotation for devices with home button
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    if (self.landscapeConstraints == nil) {
        self.landscapeConstraints = @[
               [self.areYouReady.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:size.height / 7],
               [self.areYouReady.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
               [self.areYouReady.widthAnchor constraintEqualToConstant:size.width],
               [self.areYouReady.heightAnchor constraintEqualToConstant:44],

               [self.startButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-size.height / 7],
               [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
               [self.startButton.widthAnchor constraintEqualToConstant:size.width / 3 * 2],
               [self.startButton.heightAnchor constraintEqualToConstant:55],

               [self.myRectangle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: size.height / 3],
               [self.myRectangle.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
               [self.myRectangle.widthAnchor constraintEqualToConstant:70],
               [self.myRectangle.heightAnchor constraintEqualToConstant:70],

               [self.myCircle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: size.height / 3],
               [self.myCircle.trailingAnchor constraintEqualToAnchor:self.myRectangle.leadingAnchor constant: -20],
               [self.myCircle.widthAnchor constraintEqualToConstant:70],
               [self.myCircle.heightAnchor constraintEqualToConstant:70],

               [self.myTriangle.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: size.height / 3],
               [self.myTriangle.leadingAnchor constraintEqualToAnchor:self.myRectangle.trailingAnchor constant: 20],
               [self.myTriangle.widthAnchor constraintEqualToConstant:70],
               [self.myTriangle.heightAnchor constraintEqualToConstant:70]
           ];
    }

    [self deviceOrientation];
}

- (void)deviceOrientation {
    UIDevice* device = [UIDevice currentDevice];
    switch (device.orientation) {
        case UIDeviceOrientationPortrait:
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            NSLog(@"Portrait");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            [NSLayoutConstraint deactivateConstraints:self.landscapeConstraints];
            [NSLayoutConstraint activateConstraints:self.portraitConstraints];
            NSLog(@"Portrait");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            NSLog(@"Landscape");
            break;
            
        case UIDeviceOrientationLandscapeRight:
            [NSLayoutConstraint deactivateConstraints:self.portraitConstraints];
            [NSLayoutConstraint activateConstraints:self.landscapeConstraints];
            NSLog(@"Landscape");
            break;
            
        default:
            break;
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)setUpTabBar:(UITabBarController*)tab {
    self.tabBar = tab;
}


- (void)setUpFigures {
    self.areYouReady = [[UILabel alloc]init];
    [self.view addSubview: self.areYouReady];
    self.areYouReady.textAlignment = NSTextAlignmentCenter;
    self.areYouReady.text = @"Are you ready?";
    [self.areYouReady setFont:[UIFont systemFontOfSize:24.0 weight:UIFontWeightMedium]];
    
    
    self.myCircle = [[UIView alloc] init];
    [self.view addSubview: self.myCircle];
    self.myCircle.backgroundColor = [UIColor hex:@"0xEE686A"];
    self.myCircle.layer.cornerRadius = 35;
    self.myCircle.clipsToBounds = YES;
    
    
    self.myRectangle = [[UIView alloc] init];
    [self.view addSubview: self.myRectangle];
    self.myRectangle.backgroundColor = [UIColor hex:@"0x29C2D1"];
    
    
    self.myTriangle = [[Triangle alloc] init];
    [self.view addSubview: self.myTriangle];
    self.myTriangle.backgroundColor = UIColor.clearColor;
    
    
    self.startButton = [[UIButton alloc]init];
    [self.view addSubview: self.startButton];
    [self.startButton addTarget:self action:@selector(presentTabBarController) forControlEvents:UIControlEventTouchUpInside];
    self.startButton.backgroundColor = [UIColor hex:@"0xF9CC78"];
    self.startButton.layer.cornerRadius = 27;
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    [self.startButton.titleLabel setFont:[UIFont systemFontOfSize:20.0 weight:UIFontWeightMedium]];
    [self.startButton setTitleColor: [UIColor hex:@"0x101010"] forState:UIControlStateNormal];
   
    
}

- (void)presentTabBarController {
    [self presentViewController:self.tabBar animated:true completion:nil];
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

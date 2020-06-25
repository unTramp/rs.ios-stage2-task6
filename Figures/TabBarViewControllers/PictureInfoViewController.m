//
//  PictureInfoViewController.m
//  Figures
//
//  Created by Andrey Dorofeev on 25/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "PictureInfoViewController.h"

@interface PictureInfoViewController ()
@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation PictureInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupScrollView];
    

    //
    UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width - 20, self.view.frame.size.height + 500)];
    contentView.backgroundColor = [UIColor yellowColor];
    
    [self.scrollView addSubview:contentView];
}

- (void)setupScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 80],
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:10],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:10]
    ]];
}

@end

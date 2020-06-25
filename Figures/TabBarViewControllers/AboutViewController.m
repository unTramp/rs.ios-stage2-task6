//
//  AboutViewController.m
//  Figures
//
//  Created by Andrey Dorofeev on 20/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "AboutViewController.h"
#import "UIColor+ColorExtensions.h"
#import "AboutViewCell.h"
#import "FiguresTableViewCell.h"
#import "ButtonsTableViewCell.h"

@interface AboutViewController ()
@property (nonatomic, strong) NSArray* portraitConstraints;
@property (nonatomic, strong) NSArray* landscapeConstraints;

@property (nonatomic, strong) UIView* phoneInfoView;
@property (nonatomic, strong) UIView* figuresView;
@property (nonatomic, strong) UIView* buttonsView;

@property (nonatomic, strong) UITableView* aboutTableView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self navigationBarCustomization];
    [self setUpTableView];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (void)navigationBarCustomization {
    self.navigationController.navigationBar.topItem.title = @"RSSchool Task 6";
    [self.navigationController.navigationBar setBarTintColor:[UIColor hex:@"0xF9CC78"]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSForegroundColorAttributeName: [UIColor hex:@"0x101010"],
        NSFontAttributeName: [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]
    }];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self.aboutTableView reloadData];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void) setUpTableView {
    self.aboutTableView = [[UITableView alloc] init];
    [self.view addSubview:self.aboutTableView];
    self.aboutTableView.scrollEnabled = false;
    self.aboutTableView.delegate = self;
    self.aboutTableView.dataSource = self;
    self.aboutTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.aboutTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.aboutTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.aboutTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.aboutTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    
    [self.aboutTableView registerClass:[FiguresTableViewCell class] forCellReuseIdentifier:@"figureCell"];
    [self.aboutTableView registerClass:[AboutViewCell class] forCellReuseIdentifier:@"aboutCell"];
    [self.aboutTableView registerClass:[ButtonsTableViewCell class] forCellReuseIdentifier:@"buttonCell"];
    
    self.aboutTableView.backgroundColor = [UIColor yellowColor];
    self.aboutTableView.separatorInset = UIEdgeInsetsMake(0, 60, 0, 60);
    self.aboutTableView.separatorColor = [UIColor darkGrayColor];
    self.aboutTableView.allowsSelection = false;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIDevice* device = [UIDevice currentDevice];
    if (indexPath.row == 0) {
        AboutViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"aboutCell"];
        [cell deviceOrientation:device.orientation];
        return cell;
    } else if (indexPath.row == 1){
        FiguresTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"figureCell"];
        [cell deviceOrientation:device.orientation];
        return cell;
    } else {
        ButtonsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"buttonCell"];
        [cell deviceOrientation:device.orientation];
        [cell.startButton addTarget:self action:@selector(backToRoot) forControlEvents:UIControlEventTouchUpInside];
        [cell.cvButton addTarget:self action:@selector(goToUrl) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - self.tabBarController.tabBar.frame.size.height) / 3;
}

- (void)backToRoot {
     [self.navigationController dismissViewControllerAnimated:true completion:nil];
}

- (void)goToUrl {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"https://github.com/unTramp"];
    [application openURL:URL options:@{} completionHandler:nil];
}

@end

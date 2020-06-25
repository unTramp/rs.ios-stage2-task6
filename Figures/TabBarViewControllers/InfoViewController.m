//
//  InfoViewContorller.m
//  Figures
//
//  Created by Andrey Dorofeev on 20/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "InfoViewController.h"
#import "UIColor+ColorExtensions.h"
#import "FileTableViewCell.h"
#import "PictureInfoViewController.h"

@interface InfoViewController () 
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) Service* service;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setUpTableView];
    [self navigationBarCustomization];
    [self.tableView reloadData];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)setUpWithService:(Service*) service {
    self.service = service;
}

- (void) setUpTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView registerClass:FileTableViewCell.class forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:self.tableView];
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 10],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}

- (void)navigationBarCustomization {
    self.navigationController.navigationBar.topItem.title = @"Info";
    [self.navigationController.navigationBar setBarTintColor:[UIColor hex:@"0xF9CC78"]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSForegroundColorAttributeName: [UIColor hex:@"0x101010"],
        NSFontAttributeName: [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]
    }];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.service getNumberOfAssets];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    [cell setUpWithService:self.service];
    [cell configureFileCellWithIndex:indexPath.row];
    UIView* bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor hex: @"0xFDF4E3"];
    [cell setSelectedBackgroundView:bgColorView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PictureInfoViewController* pictureVC = [[PictureInfoViewController alloc] init];
    [self.navigationController pushViewController:pictureVC animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadTableView];
}

- (void) reloadTableView {
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end

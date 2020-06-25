//
//  GalleryViewController.m
//  Figures
//
//  Created by Andrey Dorofeev on 20/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "GalleryViewController.h"
#import "UIColor+ColorExtensions.h"
#import "ShowPictureViewController.h"

@interface GalleryViewController ()
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSMutableArray* assets;
@property (nonatomic, strong) Service* service;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBarCustomization];
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:self.collectionView];
    [NSLayoutConstraint activateConstraints:@[
        [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    [self.collectionView reloadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCollectionView) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)setUpWithService:(Service*) service {
    self.service = service;
}

- (void)navigationBarCustomization {
    self.navigationController.navigationBar.topItem.title = @"Gallery";
    [self.navigationController.navigationBar setBarTintColor:[UIColor hex:@"0xF9CC78"]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSForegroundColorAttributeName: [UIColor hex:@"0x101010"],
        NSFontAttributeName: [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.service getNumberOfAssets];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator setCenter:[cell.contentView center]];
    [cell.contentView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.backgroundView = [[UIImageView alloc] initWithImage:[self.service getImageByIndex:indexPath.row isOriginal:false]];
            cell.backgroundColor = UIColor.blueColor;
            [activityIndicator stopAnimating];
        });
    });
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width)/ 3 -4, (self.view.frame.size.width)/ 3 -4);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(3, 3, 3, 3);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ShowPictureViewController* showImageVC = [[ShowPictureViewController alloc] init];
    [showImageVC configureWithImage:[self.service getImageByIndex:indexPath.row isOriginal:true]];
    [self.navigationController presentViewController:showImageVC animated:true completion:nil];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 3;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 3;
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadCollectionView];
}

- (void) reloadCollectionView {
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
}

@end

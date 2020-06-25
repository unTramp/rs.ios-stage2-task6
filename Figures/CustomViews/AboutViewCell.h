//
//  AboutViewCell.h
//  Figures
//
//  Created by Andrey Dorofeev on 25/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView* appleImageView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* modelLabel;
@property (nonatomic, strong) UILabel* systemLabel;

@property (nonatomic, strong) NSArray* portraitConstraints;
@property (nonatomic, strong) NSArray* landscapeConstraints;

- (void)deviceOrientation:(UIDeviceOrientation)orientation;

@end

NS_ASSUME_NONNULL_END

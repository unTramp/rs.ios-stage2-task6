//
//  ButtonsTableViewCell.h
//  Figures
//
//  Created by Andrey Dorofeev on 25/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ButtonsTableViewCell : UITableViewCell
@property (nonatomic, strong) UIButton* cvButton;
@property (nonatomic, strong) UIButton* startButton;

@property (nonatomic, strong) NSArray* portraitConstraints;
@property (nonatomic, strong) NSArray* landscapeConstraints;

- (void)deviceOrientation:(UIDeviceOrientation)orientation;
@end

NS_ASSUME_NONNULL_END

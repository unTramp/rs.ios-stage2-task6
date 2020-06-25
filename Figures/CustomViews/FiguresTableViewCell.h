//
//  FiguresTableViewCell.h
//  Figures
//
//  Created by Andrey Dorofeev on 25/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Triangle.h"
#import "UIColor+ColorExtensions.h"

NS_ASSUME_NONNULL_BEGIN

@interface FiguresTableViewCell : UITableViewCell

@property (nonatomic, strong) Triangle* myTriangle;
@property (nonatomic, strong) UIView* myRectangle;
@property (nonatomic, strong) UIView* myCircle;

@property (nonatomic, strong) NSArray* portraitConstraints;
@property (nonatomic, strong) NSArray* landscapeConstraints;

- (void)deviceOrientation:(UIDeviceOrientation)orientation;
@end

NS_ASSUME_NONNULL_END

//
//  FileTableViewCell.h
//  Figures
//
//  Created by Andrey Dorofeev on 21/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "Service.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* fileImageView;
@property (nonatomic, strong) UILabel* fileNameLabel;
@property (nonatomic, strong) UIImageView* iconFileTypeImageView;
@property (nonatomic, strong) UILabel* fileSizeLabel;
@property (nonatomic, strong) Service* service;

- (void)setUpWithService:(Service*) service;
- (void)configureFileCellWithIndex:(NSInteger) index;

@end

NS_ASSUME_NONNULL_END

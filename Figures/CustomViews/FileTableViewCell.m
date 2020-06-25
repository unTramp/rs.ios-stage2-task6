//
//  FileTableViewCell.m
//  Figures
//
//  Created by Andrey Dorofeev on 21/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "FileTableViewCell.h"

@implementation FileTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setUpWithService:(Service*) service {
    self.service = service;
}

- (void)setupViews {
    self.fileImageView = [[UIImageView alloc] init];
    [self addSubview:self.fileImageView];
    self.fileImageView.translatesAutoresizingMaskIntoConstraints = false;
    self.fileImageView.clipsToBounds = true;
    [NSLayoutConstraint activateConstraints:@[
        [self.fileImageView.widthAnchor constraintLessThanOrEqualToConstant:90],
        [self.fileImageView.heightAnchor constraintEqualToConstant:90],
        [self.fileImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.fileImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
    ]];

    self.fileNameLabel = [[UILabel alloc] init];
    [self addSubview:self.fileNameLabel];
    self.fileNameLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.fileNameLabel.clipsToBounds = true;
    [self.fileNameLabel setFont:[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold]];
    self.fileNameLabel.text = @"Image name";
    [NSLayoutConstraint activateConstraints:@[
        [self.fileNameLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.fileNameLabel.heightAnchor constraintEqualToConstant:40],
        [self.fileNameLabel.leadingAnchor constraintEqualToAnchor:self.fileImageView.trailingAnchor constant:20],
        [self.fileNameLabel.bottomAnchor constraintEqualToAnchor:self.fileImageView.centerYAnchor constant:8]
    ]];
    
    self.iconFileTypeImageView = [[UIImageView alloc] init];
    [self addSubview:self.iconFileTypeImageView];
    self.iconFileTypeImageView.translatesAutoresizingMaskIntoConstraints = false;
    self.iconFileTypeImageView.clipsToBounds = true;
    [NSLayoutConstraint activateConstraints:@[
        [self.iconFileTypeImageView.widthAnchor constraintLessThanOrEqualToConstant:25],
        [self.iconFileTypeImageView.heightAnchor constraintEqualToConstant:30],
        [self.iconFileTypeImageView.leadingAnchor constraintEqualToAnchor:self.fileNameLabel.leadingAnchor],
        [self.iconFileTypeImageView.topAnchor constraintEqualToAnchor:self.fileImageView.centerYAnchor constant:8]
    ]];
    
    self.fileSizeLabel = [[UILabel alloc] init];
    [self addSubview:self.fileSizeLabel];
    self.fileSizeLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.fileSizeLabel.clipsToBounds = true;
    [self.fileSizeLabel setFont:[UIFont systemFontOfSize:12.0 weight:UIFontWeightRegular]];
    self.fileSizeLabel.text = @"file size";
    [NSLayoutConstraint activateConstraints:@[
        [self.fileSizeLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.fileSizeLabel.heightAnchor constraintEqualToConstant:20],
        [self.fileSizeLabel.leadingAnchor constraintEqualToAnchor:self.iconFileTypeImageView.trailingAnchor constant:8],
        [self.fileSizeLabel.centerYAnchor constraintEqualToAnchor:self.iconFileTypeImageView.centerYAnchor]
    ]];
}

- (void)configureFileCellWithIndex:(NSInteger) index {
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
       dispatch_async(queue, ^{
           dispatch_async(dispatch_get_main_queue(), ^{
               self.fileNameLabel.text = [self.service getAssetFileNameByIndex:index];
               [self.fileImageView setImage:[self.service getImageByIndex:index isOriginal:false]];
               switch ([self.service getMediaTypeByIndex:index]) {
                   case 0:
                       self.iconFileTypeImageView.image = [UIImage imageNamed: @"unknown"];
                       self.fileSizeLabel.text = @" ";
                       break;
                       
                   case 1:
                       self.iconFileTypeImageView.image = [UIImage imageNamed: @"image"];
                       self.fileSizeLabel.text = [NSString stringWithFormat:@"%lux%lu", [self.service getPixelHeightByIndex:index], [self.service getPixelWidthByIndex:index]];
                       break;
                       
                   case 2:
                       self.iconFileTypeImageView.image = [UIImage imageNamed: @"audio"];
                       self.fileSizeLabel.text = [NSString stringWithFormat:@"%@", [self.service getDurationByIndex:index]];
                       
                   case 3:
                       self.iconFileTypeImageView.image = [UIImage imageNamed: @"video"];
                       self.fileSizeLabel.text = [NSString stringWithFormat:@"%lux%lu %@", [self.service getPixelHeightByIndex:index], [self.service getPixelWidthByIndex:index], [self.service getDurationByIndex:index]];
                       
                   default:
                       break;
               }
           });
       });
}

@end

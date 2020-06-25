//
//  Service.m
//  Figures
//
//  Created by Andrey Dorofeev on 24/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "Service.h"

@implementation Service

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.assets = [[NSMutableArray alloc] init];
        [self getAssets];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadAssets) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (void)getAssets {
    PHFetchOptions* options = [[PHFetchOptions alloc]init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:true]];
    PHFetchResult* result = [PHAsset fetchAssetsWithOptions:options];
    
    for (PHAsset* asset in result) {
        [self.assets addObject:asset];
    }
}

- (NSInteger)getNumberOfAssets {
    return self.assets.count;
}

- (UIImage*)getImageByIndex:(NSInteger) index {
    
    PHAsset* asset = self.assets[index];
    PHImageRequestOptions* requestOptions = [[PHImageRequestOptions alloc] init];
    requestOptions.resizeMode   = PHImageRequestOptionsResizeModeExact;
    requestOptions.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    requestOptions.synchronous = YES;
    PHImageManager *manager = [PHImageManager defaultManager];

    __block UIImage* img;
    
    [manager requestImageForAsset:asset
                       targetSize:CGSizeMake(180, 180)
                      contentMode:PHImageContentModeDefault
                          options:requestOptions
                    resultHandler:^void(UIImage *image, NSDictionary *info) {
        img = image;
    }];
    
    return img;
}

- (UIImage*)getOriginalImageByIndex:(NSInteger) index {
    
    PHAsset* asset = self.assets[index];
    PHImageRequestOptions* requestOptions = [[PHImageRequestOptions alloc] init];
    requestOptions.resizeMode   = PHImageRequestOptionsResizeModeExact;
    requestOptions.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    requestOptions.synchronous = YES;
    PHImageManager *manager = [PHImageManager defaultManager];

    __block UIImage* img;
    
    [manager requestImageForAsset:asset
                       targetSize:PHImageManagerMaximumSize
                      contentMode:PHImageContentModeDefault
                          options:requestOptions
                    resultHandler:^void(UIImage *image, NSDictionary *info) {
        img = image;
    }];
    
    return img;
}


- (NSString*) getAssetFileNameByIndex:(NSInteger) index {
    return [[self.assets objectAtIndex:index] valueForKey:@"filename"];
}

- (PHAssetMediaType) getMediaTypeByIndex:(NSInteger) index {
    PHAsset* asset = [self.assets objectAtIndex:index];
    return asset.mediaType;
}

- (NSUInteger) getPixelHeightByIndex:(NSInteger) index {
    PHAsset* asset = [self.assets objectAtIndex:index];
    return asset.pixelHeight;
}

- (NSUInteger) getPixelWidthByIndex:(NSInteger) index {
    PHAsset* asset = [self.assets objectAtIndex:index];
    return asset.pixelWidth;
}

- (NSString*) getDurationByIndex:(NSInteger) index {
    PHAsset* asset = [self.assets objectAtIndex:index];
    return [self timeFormatted:asset.duration];
}

- (NSString*)timeFormatted:(int)totalSecond {
    int seconds = totalSecond % 60;
    int minutes = (totalSecond / 60) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}

- (void) reloadAssets {
    [self.assets removeAllObjects];
    [self getAssets];
}

@end

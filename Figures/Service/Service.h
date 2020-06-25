//
//  Service.h
//  Figures
//
//  Created by Andrey Dorofeev on 24/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>


NS_ASSUME_NONNULL_BEGIN

@interface Service : NSObject

@property (nonatomic, strong) NSMutableArray* assets;

- (UIImage*)getImageByIndex:(NSInteger) index isOriginal:(BOOL) isOriginalSize;
- (NSString*) getAssetFileNameByIndex:(NSInteger) index;
- (PHAssetMediaType) getMediaTypeByIndex:(NSInteger) index;
- (NSUInteger) getPixelHeightByIndex:(NSInteger) index;
- (NSUInteger) getPixelWidthByIndex:(NSInteger) index;
- (NSString*) getDurationByIndex:(NSInteger) index;
- (NSInteger)getNumberOfAssets;

@end

NS_ASSUME_NONNULL_END

//
//  UIColor+ColorExtensions.h
//  Figures
//
//  Created by Andrey Dorofeev on 20/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorExtensions)
+ (UIColor*) hex:(NSString*)hexCode;
@end

NS_ASSUME_NONNULL_END

//
//  Bezie.m
//  Figures
//
//  Created by Andrey Dorofeev on 20/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "Triangle.h"
#import "UIColor+ColorExtensions.h"

@implementation Triangle

- (void)drawRect:(CGRect)rect {
    UIBezierPath* linePath;
    CGRect rec = rect;
    linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(rec.size.width / 2.0, rec.origin.y)];
    [linePath addLineToPoint:CGPointMake(rec.size.width, rec.size.height)];
    [linePath addLineToPoint:CGPointMake(rec.origin.x, rec.size.height)];
    [linePath closePath];
    [[UIColor hex:@"0x34C1A1"] setFill];
    [linePath fill];
    [UIColor.clearColor setStroke];
    [linePath stroke];
}

@end

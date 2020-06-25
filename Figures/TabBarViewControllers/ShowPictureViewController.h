//
//  ShowPictureViewController.h
//  Figures
//
//  Created by Andrey Dorofeev on 23/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowPictureViewController : UIViewController
- (void)configureWithImage:(UIImage*)img;
@end

NS_ASSUME_NONNULL_END

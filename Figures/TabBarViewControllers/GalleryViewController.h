//
//  GalleryViewController.h
//  Figures
//
//  Created by Andrey Dorofeev on 20/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "Service.h"

NS_ASSUME_NONNULL_BEGIN

@interface GalleryViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
- (void)setUpWithService:(Service*) service;
@end

NS_ASSUME_NONNULL_END

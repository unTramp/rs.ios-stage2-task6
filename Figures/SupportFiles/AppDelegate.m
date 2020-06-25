//
//  AppDelegate.m
//  Figures
//
//  Created by Andrey Dorofeev on 19/06/2020.
//  Copyright © 2020 Andrey Dorofeev. All rights reserved.
//

#import "AppDelegate.h"
#import "InfoViewController.h"
#import "GalleryViewController.h"
#import "AboutViewController.h"
#import "UIColor+ColorExtensions.h"
#import "ViewController.h"
#import "Service.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    ViewController* mainVC = [[ViewController alloc] init];
    UINavigationController* mainNavig = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainNavig.navigationBarHidden = true;
    Service* service = [[Service alloc] init];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    
    InfoViewController* infoVC = [[InfoViewController alloc] init];
    [infoVC setUpWithService:service];
    UINavigationController* navigInfoVC = [[UINavigationController alloc] initWithRootViewController:infoVC];
    navigInfoVC.tabBarItem.image = [UIImage imageNamed:@"info_unselected"];
    navigInfoVC.tabBarItem.selectedImage = [UIImage imageNamed:@"info_selected"];
    navigInfoVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    
    GalleryViewController* galleryVC = [[GalleryViewController alloc] init];
    [galleryVC setUpWithService:service];
    UINavigationController* navigGalleryVC = [[UINavigationController alloc] initWithRootViewController:galleryVC];
    navigGalleryVC.tabBarItem.image = [UIImage imageNamed:@"gallery_unselected"];
    navigGalleryVC.tabBarItem.selectedImage = [UIImage imageNamed:@"gallery_selected"];
    navigGalleryVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    [navigGalleryVC setModalPresentationCapturesStatusBarAppearance:true];
    
    
    AboutViewController* aboutVC = [[AboutViewController alloc] init];
    UINavigationController* navigAboutVC = [[UINavigationController alloc] initWithRootViewController:aboutVC];
    aboutVC.tabBarItem.image = [UIImage imageNamed:@"home_unselected"];
    aboutVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    aboutVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    tabBar.viewControllers = @[navigInfoVC, navigGalleryVC, navigAboutVC];
    tabBar.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tabBar.selectedIndex = 1;
    [tabBar setModalPresentationCapturesStatusBarAppearance:true];
    
    [mainVC setUpTabBar:tabBar];
    self.window.rootViewController = mainNavig;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end

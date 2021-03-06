//
//  RAAppDelegate.m
//  Recipe App
//
//  Created by Joshua Howland on 5/21/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RAAppDelegate.h"
#import "RecipeViewController.h"

@implementation RAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[RecipeViewController new]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end

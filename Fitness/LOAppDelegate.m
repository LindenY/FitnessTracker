//
//  LOAppDelegate.m
//  Fitness
//
//  Created by Desmond Lin on 3/12/2014.
//  Copyright (c) 2014 Lopal. All rights reserved.
//

#import "LOAppDelegate.h"
#import "LOUser.h"
#import "LOStartingViewController.h"
#import "LOTypeSelctionViewController.h"

@implementation LOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    if ([LOUser shareUser].archivedFromFile) {
        LOTypeSelctionViewController * tsvc = [[LOTypeSelctionViewController alloc] init];
        UINavigationController * nc = [[UINavigationController alloc] initWithRootViewController:tsvc];
        [self.window setRootViewController:nc];
    }else{
        LOStartingViewController * svc = [[LOStartingViewController alloc] init];
        [self.window setRootViewController:svc];
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    if ([LOUser shareUser].save) {
        NSLog(@"User file saved");
    }else{
        NSLog(@"User file save failed");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    if ([LOUser shareUser].save) {
        NSLog(@"User file saved");
    }else{
        NSLog(@"User file save failed");
    }
}

@end

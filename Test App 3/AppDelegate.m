//
//  AppDelegate.m
//  Test App 3
//
//  Created by Sgro on 11/12/14.
//  Copyright (c) 2014 Richard Sgro. All rights reserved.
//

#import "AppDelegate.h"
#import <Leanplum/Leanplum.h>
#import "LocalyticsSession.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Insert your API keys here.
#ifdef DEBUG
    LEANPLUM_USE_ADVERTISING_ID;
    [Leanplum setAppId:@"y79iaHxW3PK5ghxJthP96iknCL8PXcvgxYJJ3psLGmE" withDevelopmentKey:@"bgKZ9jWTWiQLfXUXYTrpgZ8pHXqDl3AtsVDrWtqmsd0"];
#else
    [Leanplum setAppId:@"y79iaHxW3PK5ghxJthP96iknCL8PXcvgxYJJ3psLGmE" withProductionKey:@"qvRYUIZ6Wnd10gLptXV4oGTLUMm0TWKRXfOOJIpqy64"];
#endif
    
    // Syncs all the files between your main bundle and Leanplum.
    // This allows you to swap out and A/B test any resource file
    // in your project in realtime.
    [Leanplum syncResourcesAsync:YES];
    
    // Tracks in-app purchases automatically as the "Purchase" event.
    // To require valid receipts upon purchase or change your reported
    // currency code from USD, update your app settings.
    [Leanplum trackInAppPurchases];
    
    // Tracks all screens in your app as states in Leanplum.
    [Leanplum trackAllAppScreens];
    
    // Starts a new session and updates the app content from Leanplum.
    [Leanplum start];
    
    
    [[LocalyticsSession shared] LocalyticsSession:@"c9b3f6179b6543b31d3f6b3-74631094-26fa-11e4-a2e9-009c5fda0a25"];
    [[LocalyticsSession shared] setLoggingEnabled:YES];  // Used while testing
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
    
}

@end

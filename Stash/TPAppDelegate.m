//
//  TPAppDelegate.m
//  Stash
//
//  Created by Taylor Potter on 4/30/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPAppDelegate.h"
#import "TPViewController.h"
//#import "TestFlight.h"

@implementation TPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  /*Stash token for Testflight app */
  
  // [TestFlight takeOff:@"e4d543bc-7460-44b5-97eb-1f0c36a443a5"];
  
  self.ideaController = [[TPIdeaController alloc] initWithArchive];
  
  BOOL IS_IPHONE_SCREEN_LARGE = [[UIScreen mainScreen]bounds].size.height == 568 ? YES : NO;
  
  if (IS_IPHONE_SCREEN_LARGE) {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TPViewController *rootViewController = [mainStoryBoard instantiateInitialViewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = rootViewController;
    
    NSLog(@"User has 4 inch screen.");
  } else {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"SmallScreen" bundle:nil];
    TPViewController *rootViewController = [mainStoryBoard instantiateInitialViewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = rootViewController;
    
    NSLog(@"User has 3.5 inch screen.");
  }
  
  return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
//
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
//
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
//
}

- (void)applicationWillTerminate:(UIApplication *)application
{
//
}

@end

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
  [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"eb02529dc5ae1108856ed5ff32b81b06"];
  [[BITHockeyManager sharedHockeyManager] startManager];
  [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];

  
  self.ideaController = [[TPIdeaController alloc] initWithArchive];
  
  BOOL IS_IPHONE_SCREEN_LARGE = [[UIScreen mainScreen]bounds].size.height == 568 ? YES : NO;
  
  if (IS_IPHONE_SCREEN_LARGE) {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TPViewController *rootViewController = [mainStoryBoard instantiateInitialViewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = rootViewController;
    
    NSLog(@"User has 4 inch screen.");
  } else {
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Small" bundle:nil];
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

//
//  TPNavigationController.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPNavigationController.h"

@interface TPNavigationController ()

@end

@implementation TPNavigationController

- (IBAction)scrollToNewIdea:(id)sender
{
  
//  if ([sender tag])
//  {
  
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
    
//  }
//  
//  [[NSNotificationCenter defaultCenter] postNotificationName:@"addOrBrowseNotification" object:nil];
//  self.buttonTag = 2;
//  
  
}


@end

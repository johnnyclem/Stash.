//
//  TPHomeVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPHomeVC.h"

@interface TPHomeVC ()

@end

@implementation TPHomeVC

- (IBAction)addNewIdea:(id)sender
{
  if ([sender tag]) {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
  }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];

}

@end
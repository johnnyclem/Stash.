//
//  TPAddIdeaViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/30/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPAddIdeaViewController.h"

@interface TPAddIdeaViewController ()

@end

@implementation TPAddIdeaViewController

- (IBAction)scrollToNewIdea:(id)sender
{
  [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollToNewIdea" object:nil];
}
@end

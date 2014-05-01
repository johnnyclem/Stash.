//
//  TPBrowseIdeasVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPBrowseIdeasVC.h"
#import "TPAppDelegate.h"

@interface TPBrowseIdeasVC ()
@property (weak, nonatomic) IBOutlet UILabel *countOfIdeasArray;
@property (weak, nonatomic) TPAppDelegate *appDelegate;

@end

@implementation TPBrowseIdeasVC

-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(updateListOfIdeas)
                                               name:@"UpdateBrowseScreen"
                                             object:nil];
}


-(void)updateListOfIdeas
{
  self.countOfIdeasArray.text = [NSString stringWithFormat:@"%lu", (unsigned long)[self.ideaController.ideas count]];
  NSLog(@"%lu", (unsigned long)self.ideaController.ideas.count);
}

@end

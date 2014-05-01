//
//  TPCategorySelectionVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPCategorySelectionVC.h"
#import "TPAppDelegate.h"
#import "TPIdea.h"

@interface TPCategorySelectionVC ()
@property (weak, nonatomic) TPAppDelegate *appDelegate;


@end

@implementation TPCategorySelectionVC


-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  
  
}

- (IBAction)categorySelected:(id)sender
{
  TPIdea *idea = [TPIdea new];
  UIButton *button = (UIButton *)sender;
  idea.categoryIcon = button.imageView.image;
  self.ideaController.pendingIdea = idea;  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"categorySelected" object:nil];
}



@end

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
@property (weak, nonatomic) IBOutlet UILabel *categoryTitle;


@end

@implementation TPCategorySelectionVC


-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  self.categoryTitle.layer.borderColor = [[UIColor whiteColor] CGColor];
  self.categoryTitle.layer.borderWidth= 3.0f;
  
  
}
- (IBAction)BacktoHome:(id)sender {
   [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];
}

- (IBAction)categorySelected:(id)sender
{
  if (self.ideaController.pendingIdea) {
    UIButton *button = (UIButton *)sender;
    self.ideaController.pendingIdea.categoryIcon = button.imageView.image;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"categorySelected" object:nil];

  } else {

  TPIdea *idea = [TPIdea new];
  UIButton *button = (UIButton *)sender;
  idea.categoryIcon = button.imageView.image;
  self.ideaController.pendingIdea = idea;  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"categorySelected" object:nil];
  }
}



@end



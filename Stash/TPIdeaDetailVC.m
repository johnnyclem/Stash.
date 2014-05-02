//
//  TPIdeaDetailVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPIdeaDetailVC.h"
#import "TPAppDelegate.h"

@interface TPIdeaDetailVC ()


@property (weak, nonatomic) TPAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;
@property (weak, nonatomic) IBOutlet UITextView *appDescription;


//Still considering this one
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation TPIdeaDetailVC


-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(prepareForOnScreen)
                                               name:@"MyIdeaSelected"
                                             object:nil];
  
}

-(void)prepareForOnScreen
{
  self.appName.text = self.ideaController.mySelectedIdea.workingTitle;
  self.appIcon.image = self.ideaController.mySelectedIdea.categoryIcon;
  self.appDescription.text = self.ideaController.mySelectedIdea.appDescription;

}
@end

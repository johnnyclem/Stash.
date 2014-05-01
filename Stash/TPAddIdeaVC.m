//
//  TPAddIdeaVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPAddIdeaVC.h"
#import "TPAppDelegate.h"

@interface TPAddIdeaVC ()
@property (weak, nonatomic) TPAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UIImageView *selectedCategoryIcon;
@property (weak, nonatomic) IBOutlet UITextField *workingTitle;
@property (weak, nonatomic) IBOutlet UITextView *appDescription;



@end

@implementation TPAddIdeaVC



-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(prepareForOnScreen)
                                               name:@"categorySelected"
                                             object:nil];


}


-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  NSLog(@" view will appear");
}



-(void)prepareForOnScreen
{
  self.selectedCategoryIcon.image = self.ideaController.pendingIdea.categoryIcon;
}

- (IBAction)goHome:(id)sender {
 
  TPIdea *idea = [TPIdea new];
  idea.workingTitle = self.workingTitle.text;
  idea.appDescription = self.appDescription.text;
  self.ideaController.pendingIdea = idea;
  [self.ideaController.ideas addObject:idea];

  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"mainView" object:nil];
}



@end

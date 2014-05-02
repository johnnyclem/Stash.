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



-(void)prepareForOnScreen
{
  self.selectedCategoryIcon.image = self.ideaController.pendingIdea.categoryIcon;
}

- (IBAction)goHome:(id)sender {
 

  self.ideaController.pendingIdea.workingTitle = self.workingTitle.text;
  self.ideaController.pendingIdea.appDescription = self.appDescription.text;
  [self.ideaController.ideas addObject:self.ideaController.pendingIdea];

  //Ask why this is not self.ideaController.ideas
  [self.ideaController saveIdeas];


  [[NSNotificationCenter defaultCenter] postNotificationName:@"mainView" object:nil];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateBrowseScreen" object:nil];
    NSLog(@"%lu", (unsigned long)self.ideaController.ideas.count);

  

}



@end

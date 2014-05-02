//
//  TPAddIdeaVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPAddIdeaVC.h"
#import "TPAppDelegate.h"

@interface TPAddIdeaVC () <UITextFieldDelegate, UITextViewDelegate>
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
  
  [[self.workingTitle layer] setBorderColor:[[UIColor colorWithRed:0.21 green:0.62 blue:0.91 alpha:1] CGColor]];
  self.workingTitle.layer.borderWidth= 3.0f;
  
  self.appDescription.layer.borderColor = [[UIColor colorWithRed:0.21 green:0.62 blue:0.91 alpha:1] CGColor];
  self.appDescription.layer.borderWidth= 3.0f;
  
  
  

  
  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(prepareForOnScreen)
                                               name:@"categorySelected"
                                             object:nil];


}



-(void)prepareForOnScreen
{
  self.selectedCategoryIcon.image = self.ideaController.pendingIdea.categoryIcon;
}
- (IBAction)backButton:(id)sender {
   [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [self.workingTitle resignFirstResponder];
  [self.appDescription resignFirstResponder]; 

}








@end

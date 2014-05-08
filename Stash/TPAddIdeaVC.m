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
  
  [[self.workingTitle layer] setBorderColor:[[UIColor whiteColor] CGColor]];
  self.workingTitle.layer.borderWidth= 2.0f;
  
  self.appDescription.layer.borderColor = [[UIColor whiteColor] CGColor];
  self.appDescription.layer.borderWidth= 2.0f;
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(prepareForOnScreen)
                                               name:@"categorySelected"
                                             object:nil];


}



-(void)prepareForOnScreen
{
  [_appDescription setText:@""];
  [_workingTitle setText:@""];
  
  self.selectedCategoryIcon.image = self.ideaController.pendingIdea.categoryIcon;
}
- (IBAction)backButton:(id)sender
{
   [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];
}

- (IBAction)goHome:(id)sender
{
  if ([self.workingTitle.text isEqualToString:@""] || [self.appDescription.text isEqualToString:@""])
  {
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Not Quite!"
                                                   description:@"Every new idea needs a working title and description."
                                                          type:TWMessageBarMessageTypeError duration:2.0f];
    return;
  }
  
  [self.workingTitle resignFirstResponder];
  [self.appDescription resignFirstResponder];
  
  self.ideaController.pendingIdea.workingTitle = self.workingTitle.text;
  self.ideaController.pendingIdea.appDescription = self.appDescription.text;
  [self.ideaController.ideas addObject:self.ideaController.pendingIdea];

  [self.ideaController saveIdeas];
  
  [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Stashed!"
                                                 description:@"Your new idea was successfully added."
                                                        type:TWMessageBarMessageTypeSuccess duration:2.0f];
  double delayInSeconds = 2.0f;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"mainView" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateBrowseScreen" object:nil];
    NSLog(@"%lu", (unsigned long)self.ideaController.ideas.count);  });
 

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [self.workingTitle resignFirstResponder];
  [self.appDescription resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  
  if([text isEqualToString:@"\n"]) {
    [textView resignFirstResponder];
    return NO;
  }
  
  return YES;
}








@end

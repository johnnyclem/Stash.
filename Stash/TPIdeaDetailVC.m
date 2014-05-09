//
//  TPIdeaDetailVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPIdeaDetailVC.h"
#import "TPAppDelegate.h"

@interface TPIdeaDetailVC () <UITextFieldDelegate>


@property (weak, nonatomic) TPAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;
@property (weak, nonatomic) IBOutlet UITextView *appDescription;

@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation TPIdeaDetailVC



-(void)viewDidLoad
{
  [super viewDidLoad];
  
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  self.appDescription.contentInset = UIEdgeInsetsMake(4,25,0,0);
  


  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(prepareForOnScreen)
                                               name:@"MyIdeaSelected"
                                             object:nil];
  
}
- (IBAction)backButton:(id)sender {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
  
}

-(void)prepareForOnScreen
{
  self.appName.text = self.ideaController.mySelectedIdea.workingTitle;
  self.appIcon.image = self.ideaController.mySelectedIdea.categoryIcon;
  self.appDescription.text = self.ideaController.mySelectedIdea.appDescription;
  
  NSLog(@"%@", self.appDescription.text);

}

- (IBAction)editIdea:(id)sender {
  
  self.ideaController.pendingIdea = self.ideaController.mySelectedIdea;
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moveToAddIdea" object:nil];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"editIdeaSelected" object:nil];

}

//- (id) initWithFrame:(CGRect)frame
//{
//  if ((self = [super initWithFrame:frame]))
//  {
//    [self setup];
//  }
//  return self;
//}
//
//- (id) initWithCoder:(NSCoder *)coder
//{
//  if ((self = [super initWithCoder:coder]))
//  {
//    [self setup];
//  }
//  return self;
//}
//
//- (void) setup
//{
//
//    self.opaque = NO;
//    self.backgroundColor = [UIColor clearColor];
//    
//    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:self.bounds];
//    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    toolbar.barTintColor = self.tintColor;
//    [self insertSubview:toolbar atIndex:0];
//  
//}


@end

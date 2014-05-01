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
@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;



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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForOnScreen
{
  self.categoryImage.image = self.ideaController.pendingIdea.categoryIcon;
}
- (IBAction)goHome:(id)sender {
  
    [[NSNotificationCenter defaultCenter] postNotificationName:@"mainView" object:nil];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

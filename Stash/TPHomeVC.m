//
//  TPHomeVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPHomeVC.h"
#import "TPViewController.h"

@interface TPHomeVC () <UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet SWParallaxScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *browseButton;


@end

@implementation TPHomeVC


-(void)viewDidLoad
{
  [super viewDidLoad];
  
    self.scrollView.delegate = self;
}

//-(void)viewDidAppear:(BOOL)animated
//{
//  [super viewDidAppear:animated];
//  [_addButton setEnabled:YES];
//
//  
//}

  

- (IBAction)addNewIdea:(id)sender
{
  if ([sender tag] == 1) {
//    [_addButton setEnabled:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
    
    
  } else if ([sender tag] == 2) {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];
  }

}



@end

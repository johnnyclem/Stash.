//
//  TPBrowseIdeasVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPBrowseIdeasVC.h"

@interface TPBrowseIdeasVC ()
@property (weak, nonatomic) IBOutlet UILabel *countOfIdeasArray;
@property (strong, nonatomic) NSString *arrayCount;

@end

@implementation TPBrowseIdeasVC


-(void)viewDidLoad
{
  [super viewDidLoad];
  

  self.countOfIdeasArray.text = [NSString stringWithFormat:@"%lu", (unsigned long)[self.ideaController.ideas count]];
  
  
}

@end

//
//  TPBrowseIdeasVC.m
//  Stash
//
//  Created by Taylor Potter on 5/1/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPBrowseIdeasVC.h"
#import "TPBrowseIdeasCell.h"
#import "TPAppDelegate.h"

@interface TPBrowseIdeasVC ()

@property (weak, nonatomic) TPAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TPBrowseIdeasVC

-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(updateListOfIdeas)
                                               name:@"UpdateBrowseScreen"
                                             object:nil];
  
}


-(void)updateListOfIdeas
{
  [self.collectionView reloadData];
}

#pragma mark - CollectionView DataSource/Delegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.ideaController.ideas.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
  TPBrowseIdeasCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  TPIdea *idea = [self.ideaController.ideas objectAtIndex:indexPath.row];
  //  TPIdea *idea = [self.modelController.ideas objectAtIndex:[[[self.collectionView indexPathsForSelectedItems] lastObject] row]];
  
  cell.iconImage.image = idea.categoryIcon;
  NSLog(@"%@", cell.iconImage.image);
  
  
  return cell;
  
}

@end

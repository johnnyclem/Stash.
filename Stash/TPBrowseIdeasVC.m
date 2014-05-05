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



@interface TPBrowseIdeasVC () <UIGestureRecognizerDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) TPAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TPBrowseIdeasVC

-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.appDelegate = [[UIApplication sharedApplication] delegate];
  self.ideaController = self.appDelegate.ideaController;
  

  
  // Gets notified when a new idea is added so it can reload the collection view
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(updateListOfIdeas)
                                               name:@"UpdateBrowseScreen"
                                             object:nil];

  
  
}

-(void)updateListOfIdeas
{
  [self.collectionView reloadData];
}

- (IBAction)backButton:(id)sender {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moveRight" object:nil];
  
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
  
  cell.iconImage.image = idea.categoryIcon;
  
  return cell;
  
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
  TPIdea *idea = [self.ideaController.ideas objectAtIndex:indexPath.row];
  self.ideaController.mySelectedIdea = idea;
  
    [[NSNotificationCenter defaultCenter] postNotificationName:@"moveLeft" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyIdeaSelected" object:nil];
  
}





@end

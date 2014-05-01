//
//  TPViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/30/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPViewController.h"
#import "SWParallaxScrollView.h"

@interface TPViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *parallaxImageView;
@property (nonatomic, weak) IBOutlet SWParallaxScrollView *scrollView;

@end

@implementation TPViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  UIImage *back = [UIImage imageNamed: @"SuperViewBG"];
  
  CGSize tileSize = back.size;
  CGRect tileFrame = CGRectMake(0, 0, 5 * self.view.bounds.size.width, tileSize.height );
  
  UIImageView *bgTile = [[UIImageView alloc] initWithImage: back];
  bgTile.frame = tileFrame;
  [_scrollView addSubview:bgTile onLayer: -1];
  
  _scrollView.contentSize = CGSizeMake( 5 * self.view.bounds.size.width, tileSize.height );
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollToNewIdeaScreen) name:@"scrollToNewIdea" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
  
  [super viewDidAppear:animated];
//  [_scrollView setContentSize:CGSizeMake(1600, 568)];

}


- (void)scrollToNewIdeaScreen
{
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  [_scrollView scrollRectToVisible:CGRectMake(width*3, 0, width, height) animated:YES];
}
@end

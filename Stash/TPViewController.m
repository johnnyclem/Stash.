//
//  TPViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/30/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPViewController.h"

@interface TPViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet SWParallaxScrollView *scrollView;

@end

@implementation TPViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  
  /* Code to handle initial background/parallax view */
  UIImage *back = [UIImage imageNamed: @"SuperViewBG"];

  CGSize tileSize = back.size;
  CGRect tileFrame = CGRectMake(0, 0, 5 * self.view.bounds.size.width, tileSize.height );
  
  UIImageView *bgTile = [[UIImageView alloc] initWithImage: back];
  bgTile.frame = tileFrame;
  
  [_scrollView addSubview:bgTile onLayer: -1];
  
  _scrollView.contentSize = CGSizeMake( 5 * self.view.bounds.size.width, tileSize.height );
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(scrollRight)
                                               name:@"moveRight"
                                             object:nil];
 
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(scrolltoHome)
                                               name:@"mainView"
                                             object:nil];
  
}

- (void)viewDidAppear:(BOOL)animated
{
  
  /*Shitty way of getting the app to start from the 3rd position but it works*/
  
  [super viewDidAppear:animated];
//  CGFloat width = CGRectGetWidth(self.view.frame);
//  CGFloat height = CGRectGetHeight(self.view.frame);
//  NSLog(@" %@",NSStringFromCGRect(_scrollView.bounds));
//  [_scrollView scrollRectToVisible:CGRectMake(width *2, 0, width, height) animated:YES];
//  NSLog(@" %@",NSStringFromCGRect(_scrollView.bounds));
  
  [self scrolltoHome];
}


- (void)scrolltoHome
{
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  [_scrollView scrollRectToVisible:CGRectMake(width *2, 0, width, height) animated:YES];
  
  NSLog(@" %@",NSStringFromCGRect(_scrollView.bounds));
  

}
- (void)scrollRight
{
   NSLog(@" %@",NSStringFromCGRect(_scrollView.bounds));
  
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  CGFloat x = _scrollView.bounds.origin.x + 320;
  
  [_scrollView scrollRectToVisible:CGRectMake(x, 0, width, height) animated:YES];
  
}

- (void)scrollLeft
{
  CGFloat width = CGRectGetWidth(self.view.frame);
  CGFloat height = CGRectGetHeight(self.view.frame);
  
  CGFloat x = _scrollView.bounds.origin.x - 320;
  
  [_scrollView scrollRectToVisible:CGRectMake(x, 0, width, height) animated:YES];
  
}
@end

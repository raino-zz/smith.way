//
//  CRssDetailViewController.m
//  TestViewer
//
//  Created by Alexander on 10/10/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "CRssDetailViewController.h"

@interface CRssDetailViewController ()

@end

@implementation CRssDetailViewController

@synthesize rssItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self titleTextView] setText:[[self rssItem] title]];
    
    [[self descriptionTextView] setText:[[self rssItem] description]];
    
    NSURL *url = [NSURL URLWithString:[[self rssItem] url]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    [[self imageView] setImage:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_titleTextView release];
    [_descriptionTextView release];
    [_imageView release];
    [super dealloc];
}
@end

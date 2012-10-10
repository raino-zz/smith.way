//
//  CPictureViewController.m
//  TestViewer
//
//  Created by Alexander on 10/10/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "CPictureViewController.h"

@interface CPictureViewController ()
{
    NSArray *urls;
    int lastUrlIndex;
}

@end

@implementation CPictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        lastUrlIndex = -1;
        urls = [[NSArray alloc] initWithObjects:@"http://files.myopera.com/hoangdungksp/albums/547496/thumbs/The%20best%20flower47.png_thumb.jpg",
        @"http://3.bp.blogspot.com/_bRNnsKPyfuA/S-QbpvzKV2I/AAAAAAAACM8/wWJxvQHmQ04/s1600/flower2b.jpg",
        @"http://www.absoluteability.com/wp-content/uploads/2012/07/flower.jpg", nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshTouched:(id)sender
{
    int urlIndex;
    while (YES)
    {
        urlIndex = rand() % 3;
        if (urlIndex != lastUrlIndex)
            break;
    }
    lastUrlIndex = urlIndex;
    
    NSURL *url = [NSURL URLWithString:[urls objectAtIndex:urlIndex]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    [self.imageView setImage:image];
}

- (void)dealloc
{
    [urls release];
    [_imageView release];
    [super dealloc];
}
@end

//
//  CViewController.m
//  TestViewer
//
//  Created by Alexander on 10/10/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "CViewController.h"
#import "CPictureViewController.h"
#import "CRssViewController.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)picturesTouched:(id)sender
{
    CPictureViewController *controller = [[[CPictureViewController alloc] initWithNibName:@"CPictureViewController" bundle:nil] autorelease];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)rssTouched:(id)sender
{
    CRssViewController *controller = [[[CRssViewController alloc] initWithNibName:@"CRssViewController" bundle:nil] autorelease];
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end

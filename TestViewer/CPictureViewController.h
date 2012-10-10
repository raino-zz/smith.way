//
//  CPictureViewController.h
//  TestViewer
//
//  Created by Alexander on 10/10/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPictureViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)refreshTouched:(id)sender;

@end

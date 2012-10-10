//
//  CRssDetailViewController.h
//  TestViewer
//
//  Created by Alexander on 10/10/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRssItem.h"

@interface CRssDetailViewController : UIViewController

@property (nonatomic, retain) CRssItem *rssItem;
@property (retain, nonatomic) IBOutlet UITextView *titleTextView;
@property (retain, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;

@end

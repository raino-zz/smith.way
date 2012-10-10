//
//  CRssItem.m
//  TestViewer
//
//  Created by Alexander on 10/10/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "CRssItem.h"

@implementation CRssItem

@synthesize title;
@synthesize description;
@synthesize url;

- (void)dealloc
{
    [title release];
    [description release];
    [url release];
    [super dealloc];
}

@end

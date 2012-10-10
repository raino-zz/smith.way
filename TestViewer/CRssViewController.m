//
//  CRssViewController.m
//  TestViewer
//
//  Created by Alexander on 10/10/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "CRssViewController.h"
#import "CRssDetailViewController.h"
#import "CRssItem.h"

@interface CRssViewController ()
{
    NSMutableArray *rssItems;
    CRssItem *currentItem;
    NSMutableString *currentValue;
}

@end

@implementation CRssViewController

- (void)dealloc
{
    [rssItems release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    rssItems = [[NSMutableArray alloc] init];
    
    [self loadRss];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [rssItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    CRssItem *rssItem = [rssItems objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[rssItem title]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)loadRss
{
    @autoreleasepool
    {
        NSURL *url = [NSURL URLWithString:@"http://newsrss.bbc.co.uk/rss/sportonline_world_edition/front_page/rss.xml"];
    
        NSXMLParser *parser = [[[NSXMLParser alloc] initWithContentsOfURL:url] autorelease];
        [parser setDelegate:self];
        [parser setShouldProcessNamespaces:YES];
        [parser setShouldReportNamespacePrefixes:YES];
        [parser setShouldResolveExternalEntities:NO];
        
        BOOL success = [parser parse];
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName != nil)
    {
        elementName = qName;
    }
    
    if ([elementName isEqualToString:@"item"])
    {
        currentItem = [[CRssItem alloc] init];
    }
    else if ([elementName isEqualToString:@"title"]
             || [elementName isEqualToString:@"description"])
    {
        currentValue = [[NSMutableString alloc] init];
    }
    else if ([elementName isEqualToString:@"media:thumbnail"])
    {
        currentItem.url = [attributeDict valueForKey:@"url"];
    }
    else
    {
        [currentValue release];
        currentValue = nil;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"])
    {
        [rssItems addObject:currentItem];
        [currentItem release];
        currentItem = nil;
    }
    else if ([elementName isEqualToString:@"title"])
    {
        currentItem.title = currentValue;
    }
    else if ([elementName isEqualToString:@"description"])
    {
        currentItem.description = currentValue;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentValue appendString:string];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CRssItem *rssItem = (CRssItem*)[rssItems objectAtIndex:indexPath.row];
    
    CRssDetailViewController *controller = [[[CRssDetailViewController alloc] initWithNibName:@"CRssDetailViewController" bundle:nil] autorelease];
    controller.rssItem = rssItem;
    
    [self.navigationController pushViewController:controller animated:YES];
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end

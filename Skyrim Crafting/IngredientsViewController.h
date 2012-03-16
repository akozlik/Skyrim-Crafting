//
//  IngredientsViewController.h
//  Skyrim Crafting
//
//  Created by Andrew on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "GADBannerView.h"

@interface IngredientsViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    GADBannerView *bannerView_;
}

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) GADBannerView *bannerView_;


@end

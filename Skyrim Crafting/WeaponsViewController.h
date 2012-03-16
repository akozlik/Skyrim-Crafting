//
//  WeaponsViewController.h
//  Skyrim Crafting
//
//  Created by Andrew on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

@interface WeaponsViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    GADBannerView *bannerView_;
}

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) GADBannerView *bannerView_;

@end

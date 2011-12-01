//
//  PotionDetailViewController.h
//  Skyrim Crafting
//
//  Created by Andrew on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Effect.h"

@interface PotionDetailViewController : UITableViewController

@property (strong, nonatomic) NSArray *ingredients;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

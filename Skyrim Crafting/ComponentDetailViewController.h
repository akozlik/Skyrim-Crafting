//
//  ComponentDetailViewController.h
//  Skyrim Crafting
//
//  Created by Andrew on 12/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Component.h"

@interface ComponentDetailViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Component *component;


@end

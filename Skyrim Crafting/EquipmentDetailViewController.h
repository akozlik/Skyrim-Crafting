//
//  EquipmentDetailViewController.h
//  Skyrim Crafting
//
//  Created by Andrew on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Equipment.h"

@interface EquipmentDetailViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Equipment *equipment;

@end

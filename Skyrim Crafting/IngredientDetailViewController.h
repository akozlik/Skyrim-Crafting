//
//  IngredientDetailViewController.h
//  Skyrim Crafting
//
//  Created by Andrew on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IngredientDetailViewController : UITableViewController

@property (nonatomic, retain) NSString *primary;
@property (nonatomic, retain) NSString *secondary;
@property (nonatomic, retain) NSString *tertiary;
@property (nonatomic, retain) NSString *quaternary;

@property (nonatomic, retain) NSNumber *weight;
@property (nonatomic, retain) NSNumber *value;
@property (nonatomic, retain) NSString *location;


@end

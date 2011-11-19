//
//  Ingredient.h
//  Skyrim Crafting
//
//  Created by Andrew on 11/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * ingredient;
@property (nonatomic, retain) NSManagedObject *effects;
@property (nonatomic, retain) NSManagedObject *potions;

@end

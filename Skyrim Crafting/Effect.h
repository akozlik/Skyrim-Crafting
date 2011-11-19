//
//  Effect.h
//  Skyrim Crafting
//
//  Created by Andrew on 11/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredient;

@interface Effect : NSManagedObject

@property (nonatomic, retain) NSString * effect;
@property (nonatomic, retain) Ingredient *ingredients;

@end

//
//  Recipe.h
//  Skyrim Crafting
//
//  Created by Andrew on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Component;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSNumber * quanity;
@property (nonatomic, retain) Component *component;
@property (nonatomic, retain) NSManagedObject *equipment;

@end

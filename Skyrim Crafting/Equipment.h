//
//  Equipment.h
//  Skyrim Crafting
//
//  Created by Andrew on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Equipment : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) NSNumber * weight;

@end

//
//  AppDelegate.m
//  Skyrim Crafting
//
//  Created by Andrew on 11/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "PotionsViewController.h"
#import "IngredientsViewController.h"
#import "ArmorsViewController.h"
#import "WeaponsViewController.h"
#import "MasterViewController.h"
#import "ComponentViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize navigationController = _navigationController;

@synthesize tabController;

- (void)dealloc
{
    [_window release];
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [_navigationController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self generateInterface];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
    [self generateInterface];
}

-(void)generateInterface
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    NSMutableArray *tabViews = [[NSMutableArray alloc] init];;
    UINavigationController *navController;
    
    PotionsViewController *potionsViewController = [[[PotionsViewController alloc] init] autorelease];
    potionsViewController.managedObjectContext = self.managedObjectContext;
    navController = [[UINavigationController alloc] initWithRootViewController:potionsViewController];
    navController.navigationBar.tintColor = [UIColor darkGrayColor];
    navController.tabBarItem.image = [[UIImage imageNamed:@"91-beaker-2.png"] autorelease];
    [tabViews addObject:navController];
    
    IngredientsViewController *ingredientsViewController = [[[IngredientsViewController alloc] init] autorelease];
    ingredientsViewController.managedObjectContext = self.managedObjectContext;
    navController = [[UINavigationController alloc] initWithRootViewController:ingredientsViewController];
    navController.navigationBar.tintColor = [UIColor darkGrayColor];
    navController.tabBarItem.image = [[UIImage imageNamed:@"224-flower.png"] autorelease];
    [tabViews addObject:navController];
    
    ArmorsViewController *armorsViewController = [[[ArmorsViewController alloc] init] autorelease];
    armorsViewController.managedObjectContext = self.managedObjectContext;
    navController = [[UINavigationController alloc] initWithRootViewController:armorsViewController];
    navController.navigationBar.tintColor = [UIColor darkGrayColor];
    navController.tabBarItem.image = [[UIImage imageNamed:@"134-viking.png"] autorelease];
    [tabViews addObject:navController];    
    
    WeaponsViewController *weaponsViewController = [[[WeaponsViewController alloc] init] autorelease];
    weaponsViewController.managedObjectContext = self.managedObjectContext;
    navController = [[UINavigationController alloc] initWithRootViewController:weaponsViewController];
    navController.navigationBar.tintColor = [UIColor darkGrayColor];
    navController.tabBarItem.image = [[UIImage imageNamed:@"251-sword.png"] autorelease];
    [tabViews addObject:navController];    
    
    ComponentViewController *componentViewController = [[[ComponentViewController alloc] init] autorelease];
    componentViewController.managedObjectContext = self.managedObjectContext;
    navController = [[UINavigationController alloc] initWithRootViewController:componentViewController];
    navController.navigationBar.tintColor = [UIColor darkGrayColor];
    navController.tabBarItem.image = [[UIImage imageNamed:@"181-hammer.png"] autorelease];
    [tabViews addObject:navController];
    
    self.tabController = [[UITabBarController alloc] init];
    [self.tabController setViewControllers:tabViews];
    
    
    self.window.rootViewController = self.tabController;
    
    [self.window makeKeyAndVisible];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Skyrim_Crafting" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    
    NSString *storePath = [documentsDirectoryPath stringByAppendingPathComponent:@"Skyrim_Crafting.sqlite"];
    NSURL *storeURL = [NSURL fileURLWithPath:storePath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:storePath]) {
        NSString *defaultStorePath = [[NSBundle mainBundle] 
                                      pathForResource:@"Skyrim_Crafting" ofType:@"sqlite"];
        if (defaultStorePath) {
            [fileManager copyItemAtPath:defaultStorePath toPath:storePath error:NULL];
        }
    }
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

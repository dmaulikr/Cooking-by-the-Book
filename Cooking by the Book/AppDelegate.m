//
//  AppDelegate.m
//  Cooking by the Book
//
//  Created by Jack Smith on 4/19/16.
//  Copyright © 2016 EthanJack. All rights reserved.
//

#import "AppDelegate.h"
#import "DataClass.h"
#import "Helper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //DataClass *obj = [DataClass getInstance];
    NSString *post = [NSString stringWithFormat:@"initializeList"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSMutableURLRequest *request = [Helper setupPost:postData withURLEnd:@"initialize"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *postData, NSURLResponse *response, NSError *error) {
    
        
    NSString *ret = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    
    //Ethan needs to remove this on the server side
    ret = [ret stringByReplacingOccurrencesOfString:@"<pre>initializeList=" withString:@""];
    ret = [ret stringByReplacingOccurrencesOfString:@"</pre>" withString:@""];
        
    NSData *retData = [ret dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"initialize = %@",ret);
       
        
    NSDictionary *initDict = [NSJSONSerialization JSONObjectWithData:retData options:kNilOptions error:&error];
    NSArray *ingredientAry = [initDict objectForKey:@"ingredientInfo"];
    NSLog(@"initAry count = %lu",(unsigned long)ingredientAry.count);
        
    //retrieve core ingredient array
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Ingredients"];
    NSMutableArray *coreIngredientAry = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
/*
    for (int i=0;i<ingredientAry.count;i++){
       NSMutableDictionary *ingredientDict = [ingredientAry objectAtIndex:i];
       NSString *ingredientID = [ingredientDict objectForKey:@"ingredientID"];
 
        
        if ([coreIngredientDict objectForKey:ingredientID]==nil){
            NSManagedObject *ingredient = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredient" inManagedObjectContext:managedObjectContext];
            [ingredient setValue:ingredientID forKey:@"id"];
            NSString *ingredientName = [NSString stringWithFormat:@"%@",[ingredientDict objectForKey:@"ingredientName"]];
            [ingredient setValue:ingredientName forKey:@"name"];
            
            NSError *error = nil;
            // Save the object to persistent store
            if (![managedObjectContext save:&error]) {
                NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
            }
        }
        //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id == %@",[ingredientDict objectForKey:@"ingredientID"]];
        
        NSLog(@"init dict name = %@",[ingredientDict objectForKey:@"ingredientName"]);
        NSLog(@"core data cnt = %lu",(unsigned long)coreIngredientDict.count);
        NSLog(@"core data ing 1 = %@",[coreIngredientDict )
 
    }
    
        */
        

        
    }];
    
    [dataTask resume];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)saveContext{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSManagedObjectContext *)managedObjectContext{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DataModel.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
@end
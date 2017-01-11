//
//  AppDelegate.m
//  NotificationsDZ
//
//  Created by Elerman on 03.05.16.
//  Copyright © 2016 Elerman. All rights reserved.
//

#import "AppDelegate.h"
#import "FSGovernment.h"
#import "FSDoctor.h"
#import "FSBuisness.h"
#import "FSPensioner.h"

NSString* const appDelNotification =@"appDelNotification";

NSString* const appDelUserInfoKey = @"appDelUserInfoKey";


@interface AppDelegate ()

@property (strong, nonatomic) FSGovernment* government;
@property (strong, nonatomic) FSDoctor* doctor;

@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
 
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                        name:FSGovernmentTaxLevelDidChangeNotification
                                        object:nil];
#pragma mark hzhzhzhz
    
    self.government = [[FSGovernment alloc] init];
    
    self.doctor = [[FSDoctor alloc] init];
    FSBuisness *buisnessman = [[FSBuisness alloc] init];
    FSPensioner *pensioner = [[FSPensioner alloc] init];
    
    self.doctor.salary = self.government.salary;
    buisnessman.taxLevel = self.government.taxLevel;
    pensioner.pension = self.government.pension;
    
    
    self.government.taxLevel = 5.5;
    self.government.salary = 1100;
    self.government.pension = 500;
    self.government.averagePrice = 12;
  
    
    
    self.government.salary = 1050;

    self.government.salary = 1150;
    
    self.government.averagePrice = 16;
   
    
    self.government.inflation = (self.government.averagePrice-12)/12;
    
    
    return YES;
}

- (void) governmentNotification: (NSNotification*) notification {
    NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
}

- (void) dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   /* NSDictionary* dict = [NSDictionary dictionaryWithObject:@"applicationDidEnterBackground" forKey:appDelegateApplicationDidEnterBackgroundUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:appDelegateApplicationDidEnterBackgroundNotification
                                                        object:nil
                                                      userInfo:dict];
*/
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   
    
    NSDictionary* dict = [NSDictionary dictionaryWithObject:@"applicationWillEnterForeground" forKey:appDelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:appDelNotification
                                                        object:nil
                                                      userInfo:dict];

    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");

}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");

}

@end

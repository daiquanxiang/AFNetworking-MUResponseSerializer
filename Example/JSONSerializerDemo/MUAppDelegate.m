//
//  MUAppDelegate.m
//  Paragraph
//
//  Created by Martin Ulianko on 06/03/14.
//  Copyright (c) 2014 Martin Ulianko. All rights reserved.
//

#import "MUAppDelegate.h"
#import "MUJSONResponseSerializer.h"
#import "FBUser.h"
#import <AFNetworking/AFNetworking.h>

@implementation MUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    AFHTTPRequestOperationManager *operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://graph.facebook.com/"]];
    [operationManager setResponseSerializer:[[MUJSONResponseSerializer alloc] init]];
    [(MUJSONResponseSerializer *)[operationManager responseSerializer] setResponseObjectClass:[FBUser class]];
    
    // https://developers.facebook.com/tools/explorer/
    NSLog(@"========WARINING=========");
    NSLog(@")Dont forget fill your access token, you will find it at https://developers.facebook.com/tools/explorer/");
    NSString *access_token = @"CAACEdEose0cBAFPVEdfqI2jBGeZA3nvcGqxeAMn10DwdnaBb8jstE5oiKjxVZA6ph8JQKfahAenWHuRaYDfZAgCZBh7lWpVduGEZCE3hEwMlRXP3XLyZAX4tY6dP6MDqAeRZBCEyShUZCK4RFsC9UGXv5hKbljZAnVdzFSaF4wsZCNIr0HofBWJ0TxwMDgUM8sWZBoZD";
    
    
    [operationManager GET:@"me"
               parameters:@{@"access_token": access_token}
                  success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSLog(@"%@",responseObject);
     }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
         
     }];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

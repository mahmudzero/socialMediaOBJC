//
//  AppDelegate.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/5/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "AppDelegate.h"
#import <AWSCore/AWSCore.h>

static NSString *const kLayerAppID = @"LAYER-APP-ID"; // TODO Update layer app id here

@interface AppDelegate () //<LYRClientDelegate>
//@property (nonatomic) LYRClient *layerClient;

@end

@implementation AppDelegate {
    BOOL isLoggedIn;
}

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        // Override point for customization after application launch.
        
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        isLoggedIn = YES;
        
        if(isLoggedIn) {
            [_window setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TabbedViewController"]];
            //window?.rootViewController = UIStoryboard(name: "Story1", bundle: nil).instantiateInitialViewController()
        }
        else
        {
            [_window setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"InitialViewController"]];
            //window?.rootViewController = UIStoryboard(name: "Story2", bundle: nil).instantiateInitialViewController()
        }
        
        //window?.makeKeyAndVisible()
        [_window makeKeyAndVisible];
        

        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                        identityPoolId:@"us-east-1:d77fb046-c1fd-4617-b0b2-52a625c8c0c1"];
        
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
        
        AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = configuration;
        
        // Setup Layer
        /*NSURL *appID = [NSURL URLWithString:@"APP ID"];
        self.layerClient = [LYRClient clientWithAppID:appID];
        if (self.layerClient.isConnected) {
            // LayerKit is connected, no need to call connectWithCompletion:
            // Tells LYRClient to establish a connection with the Layer service
            [self.layerClient connectWithCompletion:^(BOOL success, NSError *error) {
                if (success) {
                    NSLog(@"Client is Connected!");
                }
            }];
        }*/
        
        
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

@end

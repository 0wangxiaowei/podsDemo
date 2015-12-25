//
//  AppDelegate.m
//  podsDemo
//
//  Created by apple on 15/12/17.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeUIViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[ThreeUIViewController alloc]init];
    
//    [MBProgressHUD showHUDAddedTo:self.window animated:YES];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    //
//        [manager GET:@"http://cloud.repaiapp.com/yunying/spzt.php?id=9&app_id=3119872284&sche=fen_nine_anzhong&app_channel=Android//" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    
//            //取出“材料”数据
//            NSArray *data = responseObject[@"data"];
//            NSLog(@"%@",data);
//            //回传data
////            success(self, data);
//    
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"%@",error);
////            failure (self, error);
//        }];
    [self.window makeKeyAndVisible];
    
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

//
//  AppDelegate.h
//  LiveFaceDemo
//
//  Created by onhonehd on 2020/12/28.
//
//  Copyright © 2020年 onhonehd. All rights reserved.


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;

@property (nonatomic, strong) UIWindow *mainWindow;


@end


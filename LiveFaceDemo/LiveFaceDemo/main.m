//
//  main.m
//  LiveFaceDemo
//
//  Created by onhonehd on 2020/12/28.
//
//  Copyright © 2020年 onhonehd. All rights reserved.


#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

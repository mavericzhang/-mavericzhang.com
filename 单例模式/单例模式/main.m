//
//  main.m
//  单例模式
//
//  Created by zhangjianwei on 15/10/15.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Singleton *tempSingle = [Singleton sharedInstance];
        if(tempSingle){
            [tempSingle printLog];
             NSLog(@"not nil");
        }else
        {
            NSLog(@"nil");
        }
        [tempSingle release];
    }
    return 0;
}

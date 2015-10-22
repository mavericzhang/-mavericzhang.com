//
//  Singleton.m
//  单例模式
//
//  Created by zhangjianwei on 15/10/15.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
+ (Singleton *)sharedInstance
{
    static Singleton *tempSingleton  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tempSingleton = [[[self class] hiddenAlloc] init];
        NSLog(@"6666666666");
    });
//    dispatch_once_t time;  没有static 进不去该方法 原因如下方法
//    dispatch_once(&time, ^{
//        NSLog(@"5555555555");
//    });
    
/*
 _dispatch_once_f(dispatch_once_t *predicate, void *context,
 dispatch_function_t function)
 {
 if (__builtin_expect((*predicate), (~0l)) != ~0l) {
 dispatch_once_f(predicate, context, function);
 }
 }
 **/
    return tempSingleton;
}

- (void)printLog
{
    NSLog(@"helloworld");
}

+ (instancetype)hiddenAlloc
{
  return  [super alloc];
}

- (instancetype)copy
{
    return nil;
}

- (instancetype)mutableCopy
{
    return nil;
}

- (id)new
{
    return nil;
}

- (void)dealloc
{
    [super dealloc];
    NSLog(@"123456");
}
@end

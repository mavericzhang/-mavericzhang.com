//
//  main.m
//  门面模式
//
//  Created by zhangjianwei on 15/10/15.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//
/*
 *门面模式：接口不变，内容可以随意变动。解耦了使用者和实现者之间的关系
 *
 *
 */

#import <Foundation/Foundation.h>
@interface PersistencyManager : NSObject
- (void)store;
@end
@implementation PersistencyManager
- (void)store
{
    NSLog(@"store");
}
@end
@class HTTPClient;
@interface LibaryAPI :NSObject
@property (nonatomic,strong) PersistencyManager *perManager;
@property (nonatomic,strong) HTTPClient *httpClient;
- (void)store;
@end
@implementation LibaryAPI
- (void)store
{
    if(!self.perManager){
        self.perManager = [PersistencyManager new];
    }
    
    [self.perManager store];
}
@end



@interface HTTPClient : NSObject
- (void)request;
@end

@implementation HTTPClient
- (void)request
{
    NSLog(@"request");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        [[PersistencyManager new] store];
    }
    return 0;
}

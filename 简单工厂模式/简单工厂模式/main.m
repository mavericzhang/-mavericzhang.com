//
//  main.m
//  简单工厂模式
//
//  Created by zhangjianwei on 15/10/16.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//
/*
 *简单工厂模式:
 *
 *
 *
 */

#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSInteger,BankCardEnum){
    BankCardICBC,
    BankCardABC
};
@interface Bank : NSObject
- (void)callName;
@end

@implementation Bank

- (void)callName
{
    
}
@end

@interface ABCBank : Bank

@end

@implementation ABCBank

- (void)callName
{
    NSLog(@"ABCBank");
}

@end

@interface ICBC : Bank

@end

@implementation ICBC

- (void)callName
{
    NSLog(@"ICBCBank");
}

@end

@interface Factory : NSObject
+ (Bank *)createBankWithEnum:(BankCardEnum)cardEnum;
@end

@implementation Factory
+ (Bank *)createBankWithEnum:(BankCardEnum)cardEnum
{
    Bank *tempBank = nil;
    switch (cardEnum) {
        case BankCardABC:
        {
            tempBank = [ABCBank new];
        }
            break;
        case BankCardICBC:
        {
            tempBank = [ICBC new];
        }
            break;
        default:
            break;
    }
    
    return tempBank;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Bank *tempBank = [Factory createBankWithEnum:BankCardICBC];
        [tempBank callName];
        NSLog(@"Hello, World!");
    }
    return 0;
}

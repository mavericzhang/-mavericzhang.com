//
//  main.m
//  工厂模式
//
//  Created by zhangjianwei on 15/10/16.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//
/*
 *工厂模式：方便扩展创建类型，让子类决定实例化哪个类，类的实例化延迟到子类中去
 *
 *
 */
#import <Foundation/Foundation.h>
@interface Clothe :NSObject
- (void)showClotheType;
@end
@implementation Clothe

- (void)showClotheType
{
    
}
@end

@interface Clothe_Dota : Clothe

@end

@implementation Clothe_Dota

- (void)showClotheType
{
    NSLog(@"showDota");
}

@end

@interface Clothe_LOL : Clothe

@end

@implementation Clothe_LOL

- (void)showClotheType
{
    NSLog(@"showLOL");
}

@end

//工厂
@interface Factory : NSObject
- (Clothe *)makeClothe;
@end

@implementation Factory
- (Clothe *)makeClothe
{
    return nil;
}
@end

@interface Factory_Dota : Factory

@end

@implementation Factory_Dota

- (Clothe *)makeClothe
{
    return [Clothe_Dota new];
}
@end

@interface Factory_LOL : Factory

@end

@implementation Factory_LOL

- (Clothe *)makeClothe
{
    return [Clothe_LOL new];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Factory *clotheFactory = [Factory_LOL new];
        Clothe *clotheLOL = [clotheFactory makeClothe];
        [clotheLOL showClotheType];
    }
    return 0;
}

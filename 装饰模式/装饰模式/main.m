//
//  main.m
//  装饰模式
//
//  Created by zhangjianwei on 15/10/14.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//
/*
 *装饰模式通过组合模式给原来的类中添加功能 比继承的耦合性弱
 *
 *
 */

#import <Foundation/Foundation.h>

@interface SomeComponent : NSObject
- (void)operation;
@end

@implementation SomeComponent
- (void)operation
{
    NSLog(@"SomeComponent");
}
@end

@interface ConcreteComponent : SomeComponent

@end

@implementation ConcreteComponent
- (void)operation
{
    NSLog(@"ConcreteComponent");
}
@end


@interface Decorator : SomeComponent
@property (nonatomic,strong) SomeComponent *component;
@end

@implementation Decorator
- (void)operation
{
    if(!self.component) self.component = [SomeComponent new];
    [self.component operation];
}
@end

@interface ConcreteDecorator : Decorator
- (void)addedBehavior;
@end
@implementation ConcreteDecorator
- (void)operation
{
    [super operation];
    NSLog(@"ConcreteDecorator");
}
- (void)addedBehavior
{
    NSLog(@"addedBehavior");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        ConcreteDecorator *tempDecorator = [[ConcreteDecorator alloc] init];
        ConcreteComponent *tempComponent = [[ConcreteComponent alloc] init];
        tempDecorator.component = tempComponent;
        [tempDecorator operation];
    }
    return 0;
}

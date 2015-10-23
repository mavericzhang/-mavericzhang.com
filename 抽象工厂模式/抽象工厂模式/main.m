//
//  main.m
//  抽象工厂模式
//
//  Created by zhangjianwei on 15/10/19.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//
/*
 *
 *
 *
 */
#import <Foundation/Foundation.h>

@interface CpuBase : NSObject
- (void)calculate;
@end
@implementation CpuBase
- (void)calculate
{

}

@end

//intelCpu
@interface IntelCpu : CpuBase

@end
@implementation IntelCpu

@end

@interface MainBoardBase : NSObject
- (void)installCpuHoles;
@end
@implementation MainBoardBase
- (void)installCpuHoles
{
    
}
@end

//intel主板
@interface IntelMainBoard : MainBoardBase

@end

@implementation IntelMainBoard


@end

//工厂
@interface Factory : NSObject

- (CpuBase *)createCpu;

- (MainBoardBase *)createMainBoard;
@end

@implementation Factory
- (CpuBase *)createCpu
{
    NSLog(@"制造英特尔cpu");
    return nil;
}

- (MainBoardBase *)createMainBoard
{
    NSLog(@"制造英特尔主板");
    return nil;
}
@end

//Intel工厂
@interface IntelFactory : Factory

@end

@implementation IntelFactory

@end

@interface ComputerEngineer : NSObject
- (void)makeComputer:(Factory *)factoryBase;
@end

@implementation ComputerEngineer

- (void)makeComputer:(Factory *)factoryBase
{
    [factoryBase createMainBoard];
    [factoryBase createCpu];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        ComputerEngineer *CE = [ComputerEngineer new];
        Factory *factory = [IntelFactory new];
        [CE makeComputer:factory];
        NSLog(@"Hello, World!");
    }
    return 0;
}

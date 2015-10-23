//
//  main.m
//  策略模式
//
//  Created by zhangjianwei on 15/10/15.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//
/*
 *定义一系列的算法,把每一个算法封装起来, 并且使它们可相互替换。本模式使得算法可独立于使用它的客户而变化
 *便于扩展独立的功能模块
 *
 *
 */

#import <Foundation/Foundation.h>

@interface TravelStrategy : NSObject
- (void)travelStrategy;
@end

@implementation TravelStrategy
- (void)travelStrategy
{

}
@end

//坐飞机
@interface AirplaneStrategy : TravelStrategy

@end
@implementation AirplaneStrategy

- (void)travelStrategy
{
    NSLog(@"坐飞机玩");
}
@end

//坐火车
@interface TrainStrategy : TravelStrategy

@end

@implementation TrainStrategy

- (void)travelStrategy
{
    NSLog(@"坐火车玩");
}

@end

@interface Person : NSObject
@property (nonatomic,strong)TravelStrategy  *strategy;
- (void)travel;
@end

@implementation Person

-(void)travel
{
    [self.strategy travelStrategy];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *tempPerson = [[Person alloc] init];
        AirplaneStrategy *tempAir = [AirplaneStrategy new];
        tempPerson.strategy = tempAir;
        [tempPerson travel];
    }
    return 0;
}

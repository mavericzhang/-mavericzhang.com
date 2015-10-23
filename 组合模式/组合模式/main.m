//
//  main.m
//  组合模式
//
//  Created by zhangjianwei on 15/10/15.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SimpleComponent:NSObject
- (void)operation;
- (void)add:(SimpleComponent *)component;
- (void)removeComponent:(SimpleComponent *)component;
- (void)getChild;
@end
@implementation SimpleComponent
- (void)operation
{

}

- (void)add:(SimpleComponent *)component
{

}

- (void)removeComponent:(SimpleComponent *)component
{

}

- (void)getChild
{

}
@end

@interface Leaf : SimpleComponent

@end

@implementation Leaf
- (void)operation
{
    NSLog(@"i am a leaf");
}
@end

@interface Composite : SimpleComponent
@property (nonatomic,strong) NSMutableArray *componentArr;
@end
@implementation Composite
- (void)add:(SimpleComponent *)component
{
    [self.componentArr addObject:component];
    NSLog(@"添加模块");
}

- (NSMutableArray *)componentArr
{
    if(!_componentArr){
        _componentArr = [NSMutableArray array];
    }
    return _componentArr;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Composite *composite = [Composite new];
        [composite add:[Leaf new]];
    }
    return 0;
}

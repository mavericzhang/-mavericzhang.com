//
//  main.m
//  命令模式
//
//  Created by zhangjianwei on 15/10/20.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HouseholdApplication : NSObject
- (void)on;
- (void)off;
@end
@implementation HouseholdApplication
- (void)on
{
    NSLog(@"HouseholdApplicationon");
}

- (void)off
{
    NSLog(@"HouseholdApplicationoff");
}
@end

@interface Light : HouseholdApplication

@end

@implementation Light

@end
@interface Command : NSObject
- (void)excute;
- (void)undo;
@end

@implementation Command
- (void)excute
{

}

- (void)undo
{

}
@end


@interface LightOnCommand : Command
@property (nonatomic,strong)Light *light;

@end

@implementation LightOnCommand

- (void)excute
{
    [self.light on];
    NSLog(@"LightOnCommandself.lighton");
}

- (void)undo
{
    [self.light off];
    NSLog(@"LightOnCommandself.lightoff");
}

@end

@interface LightOffCommand : Command
@property (nonatomic,strong)Light *light;
@end

@implementation LightOffCommand
- (void)excute
{
    [self.light off];
    NSLog(@"LightOffCommandself.light off");
}

- (void)undo
{
    [self.light on];
    NSLog(@"LightOffCommandself.light on");
}
@end

@interface RemoteControlWithUndo : NSObject
@property (nonatomic,strong)NSMutableArray *onArr;
@property (nonatomic,strong)NSMutableArray *offArr;
@property (nonatomic,strong) Command *undoCommand;

- (void)setCommandWithslot:(NSInteger)slot  onCommand:(Command *)onCommand offCommand:(Command *)offCommand;
- (void)onButtonWasPushedWithslot:(NSInteger)slot;
- (void)offButtonWasPushedWithslot:(NSInteger)slot;
- (void)undoButtonWasPushedWithslot:(NSInteger)slot;
@end

@implementation RemoteControlWithUndo
- (void)setCommandWithslot:(NSInteger)slot  onCommand:(Command *)onCommand offCommand:(Command *)offCommand
{
    self.onArr[slot] = onCommand;
    self.offArr[slot] = offCommand;
}
- (void)onButtonWasPushedWithslot:(NSInteger)slot
{
    Command *tempCommand = self.onArr[slot];
    [tempCommand excute];
    self.undoCommand = tempCommand;
}
- (void)offButtonWasPushedWithslot:(NSInteger)slot
{
    Command *tempCommand = self.offArr[slot];
    [tempCommand excute];
    self.undoCommand = tempCommand;
}
- (void)undoButtonWasPushedWithslot:(NSInteger)slot
{
    [self.undoCommand undo];
}

#pragma mark - setter / getter
- (NSMutableArray *)onArr
{
    if(!_onArr)
    {
        _onArr = [[NSMutableArray alloc] initWithCapacity:7];
    }
    return _onArr;
}

- (NSMutableArray *)offArr
{
    if(!_offArr)
    {
        _offArr = [[NSMutableArray alloc] initWithCapacity:7];
    }
    return _offArr;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        RemoteControlWithUndo *remotecontrol = [RemoteControlWithUndo new];
        LightOnCommand *lightOn = [LightOnCommand new];
        lightOn.light = [Light new];
        LightOffCommand *lightOff = [LightOffCommand new];
        lightOff.light = [Light new];
        
        [remotecontrol setCommandWithslot:0 onCommand:lightOn offCommand:lightOff];
        [remotecontrol onButtonWasPushedWithslot:0];
        [remotecontrol offButtonWasPushedWithslot:0];
        [remotecontrol undoButtonWasPushedWithslot:0];
    }
    return 0;
}

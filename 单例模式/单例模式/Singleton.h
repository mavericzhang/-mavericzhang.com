//
//  Singleton.h
//  单例模式
//
//  Created by zhangjianwei on 15/10/15.
//  Copyright © 2015年 zhangjianwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
+ (Singleton *)sharedInstance;
- (void)printLog;
@end

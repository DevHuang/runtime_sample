//
//  TestModel.m
//  runtime
//
//  Created by LLVK on 26/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import "TestModel.h"
#import <objc/message.h>

@implementation TestModel

// testModel 已经写好的方法
void test(id self, SEL _cmd, NSString *word)
{
    NSLog(@"动态添加方法 %@",word);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == NSSelectorFromString(@"printWord:")) {
        
        /**
         * class_addMethod(__unsafe_unretained Class cls, SEL name, IMP imp, const char *types)
         * __unsafe_unretained Class cls : 被添加方法的类
         * SEL name : 添加方法的方法编号
         * IMP imp : 方法实现 -> 函数 -> 函数入口 ->函数名(函数地址)
         * const char *types : 方法类型
         */

        class_addMethod(self, sel, (IMP)test, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
@end

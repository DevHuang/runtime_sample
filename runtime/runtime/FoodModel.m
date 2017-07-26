//
//  FoodModel.m
//  runtime
//
//  Created by LLVK on 26/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import "FoodModel.h"
#import <objc/runtime.h>

#define encodeRuntime(A) \
\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [self valueForKey:key];\
[encoder encodeObject:value forKey:key];\
}\
free(ivars);\
\

#define initCoderRuntime(A) \
\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [decoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;\
\

@implementation FoodModel

//本类 可以参考链接  http://www.jianshu.com/p/19f280afcb24
//1. 首先我们采用正常的一般的写法
/**
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_foodId forKey:@"foodId"];
    [aCoder encodeObject:_foodName forKey:@"foodName"];
    [aCoder encodeObject:_foodDetail forKey:@"foodDetail"];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.foodId = [aDecoder decodeObjectForKey:@"foodId"];
        self.foodName = [aDecoder decodeObjectForKey:@"foodName"];
        self.foodDetail = [aDecoder decodeObjectForKey:@"foodDetail"];
    }
    return self;
}
*/

//2. 接着 为了克服属性可能较多的问题 下面采用runtime方式
/**
- (void)encodeWithCoder:(NSCoder *)encoder

{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([FoodModel class], &count);
    
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [encoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([FoodModel class], &count);
        for (int i = 0; i<count; i++) {
            // 取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            // 查看成员变量
            const char *name = ivar_getName(ivar);
            // 归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [decoder decodeObjectForKey:key];
            // 设置到成员变量身上
            [self setValue:value forKey:key];
            
        }
        free(ivars);
    }
    return self;
}
 */


//3. 采用宏的方式
- (void)encodeWithCoder:(NSCoder *)encoder

{
    encodeRuntime(FoodModel)
}

- (id)initWithCoder:(NSCoder *)decoder
{
    initCoderRuntime(FoodModel)
}
@end

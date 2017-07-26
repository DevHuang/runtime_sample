//
//  NSObject+Property.h
//  RunTime
//
//  Created by LLVK on 25/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)
// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property NSString *type;

@end

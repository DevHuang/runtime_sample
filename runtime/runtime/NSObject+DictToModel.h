//
//  NSObject+DictToModel.h
//  runtime
//
//  Created by LLVK on 26/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DictToModel <NSObject>

@optional
//用在三级数组转换
+ (NSDictionary *)arrayContainModelClass;


@end

@interface NSObject (DictToModel)
+ (instancetype)objectWithDict:(NSDictionary *)dict;
@end

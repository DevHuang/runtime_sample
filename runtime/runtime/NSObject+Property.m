//
//  NSObject+Property.m
//  RunTime
//
//  Created by LLVK on 25/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/message.h>
@implementation NSObject (Property)

- (void)setType:(NSString *)type{
    
    /**
     * Sets an associated value for a given object using a given key and association policy.
     *
     * @param object The source object for the association.
     * @param key The key for the association.
     * @param value The value to associate with the key key for object. Pass nil to clear an existing association.
     * @param policy The policy for the association. For possible values, see “Associative Object Behaviors.”
     *
     * @see objc_setAssociatedObject
     * @see objc_removeAssociatedObjects
     */
    
    /**
     id object 表示添加属性的对象
     const void *key 属性名称
     id value 属性值
     objc_AssociationPolicy policy 保存策略
     */
    
    /**
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     
     */
    
    objc_setAssociatedObject(self, @"type", type, OBJC_ASSOCIATION_RETAIN_NONATOMIC);


}
- (NSString *)type{
    
    return objc_getAssociatedObject(self, @"type");


}
@end

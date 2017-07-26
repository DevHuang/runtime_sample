//
//  UIImage+Image.m
//  RunTime
//
//  Created by LLVK on 25/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>
@implementation UIImage (Image)

+ (void)load{
   
    // （获取某个类的方法: imageNamed:）
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    //  (获取 ex_imageNamed方法地址: ex_imageNamed:)
    Method ex_imageNamed = class_getClassMethod(self, @selector(ex_imageNamed:));
    
    //  交换方法地址，method_exchangeImplementations 交换两个方法的实现
    method_exchangeImplementations(imageNamedMethod, ex_imageNamed);
}

/**
 根据name加载图片
 如果加载成功 则没有其他操作 
 */
+ (UIImage *)ex_imageNamed:(NSString *)name {
    
    UIImage *image = [UIImage ex_imageNamed:name];
    if (image) {
        NSLog(@"runtime 交换方法 找到名称为name的image");
    } else {
        NSLog(@"runtime 交换方法 未找到名称为name的image");
    }
    return image;
}

 //不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super
 //所以第二步，我们要 自己实现一个带有扩展功能的方法.
// + (UIImage *)imageNamed:(NSString *)name {
//     UIImage *image = [UIImage imageNamed:name];
//     return image;
// }
// 
@end

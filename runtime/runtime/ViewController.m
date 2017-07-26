//
//  ViewController.m
//  runtime
//
//  Created by LLVK on 26/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     runtime 常见作用
     
     动态交换两个方法的实现
     
     动态添加属性
     
     实现字典转模型的自动转换
     
     发送消息
     
     动态添加方法
     
     拦截并替换方法
     
     实现 NSCoding 的自动归档和解档
     
     */
    
    /**
     交换方法的实现
     */
    //本地有图的情况
    [self ex_changeImageNamed:@"shop_Icon"];
    //本地无图的情况
    //[self ex_changeImageNamed:@"shop"];

    /**
     动态添加属性
     */
    NSObject *obj = [[NSObject alloc]init];
    obj.type = @"我是动态添加的属性";
    NSLog(@"runtime 动态添加属性 %@",obj.type);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//动态交换两个方法的实现
- (void)ex_changeImageNamed:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

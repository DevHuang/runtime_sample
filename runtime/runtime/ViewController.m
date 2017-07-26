//
//  ViewController.m
//  runtime
//
//  Created by LLVK on 26/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "NSObject+Property.h"
#import "NSObject+DictToModel.h"
#import "TestModel.h"
#import "FoodModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    /**
     字典转模型
     */
    NSMutableSet *set = [NSMutableSet setWithArray:@[@"可变集合", @"字典->不可变集合->可变集合"]];

    NSDictionary *dict = @{@"name"  : @"devHuang",
                           @"results" : [NSSet setWithObjects:@"集合值1", @"集合值2", set , nil],
                           @"summaries" : @[@"sm1", @"sm2", @{@"keysm": @{@"stkey": @"字典->数组->字典->字典"}}],
                           @"parameters" : @{@"key1" : @"value1", @"key2": @{@"key11" : @"value11", @"key12" : @[@"三层", @"字典->字典->数组"]}},
                           @"testModel" : @{@"name"  : @"devHuang",
                                            @"count" : @(11),
                                            @"results" : [NSSet setWithObjects:@"集合值1", @"集合值2", set , nil],
                                            @"summaries" : @[@"sm1", @"sm2", @{@"keysm": @{@"stkey": @"字典->数组->字典->字典"}}],
                                            @"parameters" : @{@"key1" : @"value1", @"key2": @{@"key11" : @"value11", @"key12" : @[@"三层", @"字典->字典->数组"]}},
                                            @"classVersion" : @(1.1)}};
    TestModel *testModel = [TestModel objectWithDict:dict];
    
    NSLog(@"%@", testModel.testModel);
    
    
    /**
       动态添加方法
     */
    [testModel performSelector:@selector(printWord:) withObject:@"测试动态添加方法"];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
       runtime 下Class的各项操作
       参考原著链接 : http://www.jianshu.com/p/46dd81402f63
     */
    
    //1. 获取属性列表
    unsigned int count;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //2. 获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int j = 0; j < count; j++) {
        Method method = methodList[j];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //3. 获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int k = 0; k<count; k++) {
        Ivar myIvar = ivarList[k];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //4. 获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int l = 0; l<count; l++) {
        Protocol *myProtocal = protocolList[l];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
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

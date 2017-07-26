//
//  TestModel.h
//  runtime
//
//  Created by LLVK on 26/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

@property (nonatomic, copy ) NSString *name;

@property (nonatomic, strong) NSDictionary *results;

@property (nonatomic, strong) NSDictionary *summaries;

@property (nonatomic, strong) NSDictionary *parameters;

@property (nonatomic, strong) NSDictionary *testModel;


@end

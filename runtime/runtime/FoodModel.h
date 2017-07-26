//
//  FoodModel.h
//  runtime
//
//  Created by LLVK on 26/07/2017.
//  Copyright © 2017 devHuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodModel : NSObject<NSCoding>

@property (nonatomic, copy ) NSString *foodName;

@property (nonatomic, copy ) NSString *foodId;

@property (nonatomic, copy ) NSString *foodDetail;

- (void)printName;

- (void)printDetail;

@end

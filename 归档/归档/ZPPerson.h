//
//  ZPPerson.h
//  归档
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 想要用归档的方式把自定义对象存储在手机沙盒里面的这个自定义对象类要遵守协议<NSCoding>
 */
#import <Foundation/Foundation.h>

@interface ZPPerson : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) double height;

@end

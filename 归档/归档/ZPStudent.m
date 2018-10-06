//
//  ZPStudent.m
//  归档
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 如果一个类的子类实现了<NSCoding>协议里的代理方法的话，在实现这些代理方法的时候一定要先让父类也调用一次这些方法。
 */
#import "ZPStudent.h"

@implementation ZPStudent

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    //先编码父类的三个属性
    [super encodeWithCoder:aCoder];
    
    //再编码本类的一个属性
    [aCoder encodeObject:_no forKey:@"no"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])  //先读取父类的三个属性
    {
        _no = [aDecoder decodeObjectForKey:@"no"];  //再读取本类的一个属性
    }
    
    return self;
}

@end

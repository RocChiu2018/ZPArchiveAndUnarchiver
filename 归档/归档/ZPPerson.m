//
//  ZPPerson.m
//  归档
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPPerson.h"

@implementation ZPPerson

/**
 调用归档方法(archiveRootObject: toFile: )之后系统就会自动调用这个代理方法，询问要将对象的哪些属性进行归档。
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //将对象的name属性进行编码，意即将对象的name属性进行归档存入到沙盒的文件中。
    [aCoder encodeObject:_name forKey:@"name"];
    
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeDouble:_height forKey:@"height"];
}

/**
 调用解档方法(unarchiveObjectWithFile: )之后系统就会自动调用这个代理方法，询问要将对象的哪些属性进行解档。
 */
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        //将对象的name属性进行解档，意即将对象的name属性值进行解档从沙盒的文件中取出来。
        _name = [aDecoder decodeObjectForKey:@"name"];
        
        _age = [aDecoder decodeIntForKey:@"age"];
        _height = [aDecoder decodeDoubleForKey:@"height"];
    }
    
    return self;
}

@end

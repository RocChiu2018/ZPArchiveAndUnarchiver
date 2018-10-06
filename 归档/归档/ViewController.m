//
//  ViewController.m
//  归档
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 这种存储方式主要存储自定义对象类型的数据，所以这种存储方式具有广泛性；
 这种存储方式是把要存储的自定义对象以一种文件（不是plist文件）的方式存储在手机沙盒中的Library文件夹中的Caches文件夹中。
 */
#import "ViewController.h"
#import "ZPPerson.h"
#import "ZPStudent.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ————— 点击“存储”按钮 —————
- (IBAction)save
{
    [self savePerson];

//    [self saveStudent];
}

#pragma mark ————— 存储Person对象 —————
- (void)savePerson
{
    ZPPerson *person = [[ZPPerson alloc] init];
    person.name = @"jack";
    person.age = 10;
    person.height = 1.60;
    
    //获取手机沙盒中的Library文件夹中的Caches文件夹的路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"cachesPath = %@", cachesPath);
    
    //获取存储Person对象的路径
    NSString *savePath = [cachesPath stringByAppendingPathComponent:@"person.data"];
    
    //归档
    [NSKeyedArchiver archiveRootObject:person toFile:savePath];
}

#pragma mark ————— 存储Student对象 —————
- (void)saveStudent
{
    ZPStudent *student = [[ZPStudent alloc] init];
    student.name = @"Tom";
    student.age = 20;
    student.height = 1.75;
    student.no = @"123";
    
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"cachesPath = %@", cachesPath);
    
    NSString *savePath = [cachesPath stringByAppendingPathComponent:@"student.data"];
    
    //归档
    [NSKeyedArchiver archiveRootObject:student toFile:savePath];
}

#pragma mark ————— 点击“读取”按钮 —————
- (IBAction)read
{
    [self readPerson];
    
//    [self readStudent];
}

#pragma mark ————— 读取Person对象 —————
- (void)readPerson
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *savePath = [cachesPath stringByAppendingPathComponent:@"person.data"];
    
    //解档
    ZPPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:savePath];
    NSLog(@"%@-%d-%f", person.name, person.age, person.height);
}

#pragma mark ————— 读取Student对象 —————
- (void)readStudent
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *savePath = [cachesPath stringByAppendingPathComponent:@"student.data"];
    
    //解档
    ZPStudent *student = [NSKeyedUnarchiver unarchiveObjectWithFile:savePath];
    NSLog(@"%@-%d-%f-%@", student.name, student.age, student.height, student.no);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  protobufIOS
//
//  Created by 周刚涛 on 2017/4/16.
//  Copyright © 2017年 xyz. All rights reserved.
//

#import "ViewController.h"
#import "GPBProtocolBuffers.h"
#import "Person.pbobjc.h"
#import "User.pbobjc.h"
#import "CommonProtoBufResult.pbobjc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *pe = [[Person alloc]init];
    pe.name = @"jobs";
    pe.age = 86;
    pe.address = @"Beijing";
    
    //效率对比
    //protocbufer
    NSLog(@"protocbufer Person: %@",pe);
    NSLog(@"Person %lu",[pe data].length);
    
    
    //json
    NSDictionary *pj = @{@"name":@"jobs",
                         @"age":@86,
                         @"address":@"Beijing"};
    NSData *jsd = [NSJSONSerialization dataWithJSONObject:pj options:0 error:nil];
    NSLog(@"JSON Person: %@",pj);
    NSLog(@"Person %lu", jsd.length);
    
    
    //xml
    NSString *xml = @"<name>jobs</name><age>86</age><address>Beijing</address>";
    NSData *xmlData = [xml dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"XML Person : %@",xml);
    NSLog(@"Person %lu",xmlData.length);
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    User *user = [[User alloc] init];
    
    user.uid = 1236717812;
    user.nickname = @"asajkdhajfsdjkflhjsdklfhjlsdfhjklsdhfjklsdhfjklsdhfjksldhfklsdfjkhsdjklfhdjksfksdhajsdhajklsd";
    user.age = 20;
    
    NSLog(@"protocbufer user: %@",user);
    NSLog(@"%lu",[user data].length);
    
    //json
    NSDictionary *pj = @{@"uid":@1236717812,
                         @"age":@86,
                         @"nickname":@"asajkdhajfsdjkflhjsdklfhjlsdfhjklsdhfjklsdhfjklsdhfjksldhfklsdfjkhsdjklfhdjksfksdhajsdhajklsd"};
    NSData *jsd = [NSJSONSerialization dataWithJSONObject:pj options:0 error:nil];
    NSLog(@"JSON user: %@",pj);
    NSLog(@"%lu", jsd.length);
    
    
    //xml
    NSString *xml = @"<uid>1236717812</uid><age>86</age><nickname>asajkdhajfsdjkflhjsdklfhjlsdfhjklsdhfjklsdhfjklsdhfjksldhfklsdfjkhsdjklfhdjksfksdhajsdhajklsd</nickname>";
    NSData *xmlData = [xml dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"XML user: %@",xml);
    NSLog(@"%lu",xmlData.length);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

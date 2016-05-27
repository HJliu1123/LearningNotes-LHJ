//
//  HJConnect.m
//  字典转模型
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

#import "HJConnect.h"

@implementation HJConnect

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    if (self = [super init]) {
//        self.name = dict[@"name"];
//        self.telNum = dict[@"telNum"];
//        self.email = dict[@"email"];
//        self.addr = dict[@"addr"];
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)connectWithDictionary:(NSDictionary *)dict {
    
    return [[HJConnect alloc]initWithDictionary:dict];
    
}





@end

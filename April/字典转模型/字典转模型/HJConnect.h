//
//  HJConnect.h
//  字典转模型
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJConnect : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *telNum;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *addr;


+ (instancetype)connectWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithDictionary:(NSDictionary *)dict;


@end

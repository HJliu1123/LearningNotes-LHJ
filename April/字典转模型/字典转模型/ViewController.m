//
//  ViewController.m
//  字典转模型
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

#import "ViewController.h"
#import "HJConnect.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *connArr;
@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    

}

- (NSArray *)connArr {
    
    NSMutableArray *connArray = [NSMutableArray array];
    
    if (!_connArr) {
        NSArray *Arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"ConnectList.plist" ofType:nil]];
        
        for (NSDictionary *dict in Arr) {
            
            HJConnect *conn = [HJConnect connectWithDictionary:dict];
            
            [connArray addObject:conn];
        }
        
        
        
        
    }
    
    return [connArray copy];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.connArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    
    HJConnect *conn = self.connArr[indexPath.row];
    cell.textLabel.text = conn.name;
    cell.detailTextLabel.text = conn.telNum;
    
    
    
    return cell;
    
    
}




@end

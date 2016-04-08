//
//  ViewController.m
//  aaaaa
//
//  Created by liuhj on 16/4/7.
//  Copyright © 2016年 liuhj. All rights reserved.
//

#import "ViewController.h"
#import "HJConnect.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *connArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.userInteractionEnabled = NO;
    [self.pickerView selectRow:self.connArr.count inComponent:0 animated:YES];
    
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



- (IBAction)start:(id)sender {
    
    
    
    
}
- (IBAction)finish:(id)sender {
    
    
    
    
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.connArr.count * 50;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    HJConnect *conn = self.connArr[row % self.connArr.count];
    NSString *title = conn.name;
    return title;
}





@end

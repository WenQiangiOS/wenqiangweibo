//
//  WQRadarView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/22.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQRadarView.h"

@interface WQRadarView ()
@property (nonatomic , strong) NSMutableArray * cellArray;
@property (nonatomic , strong) NSMutableArray * cellArrImage;
@end
@implementation WQRadarView
- (NSMutableArray *)cellArray {
    if (_cellArray == nil) {
        _cellArray = [NSMutableArray array];
    }
    return _cellArray;
}

- (NSMutableArray *)cellArrImage {
    if (_cellArrImage == nil) {
        _cellArrImage = [NSMutableArray array];
    }
    return _cellArrImage;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        
         NSArray *  cellArr = @[@"雷达",@"扫一扫",@"打车"];
        self.cellArray = [NSMutableArray arrayWithArray:cellArr];
        
        NSArray * cellImage = @[@"radar_icon_radar",@"radar_icon_sweep",@"radar_icon_car"];
        self.cellArrImage = [NSMutableArray arrayWithArray:cellImage];
        
        
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    WQLOG(@"#");
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * popIDE = @"popIDe";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:popIDE];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:popIDE];
    }
    
    cell.imageView.image =[UIImage imageNamed:self.cellArrImage[indexPath.row]];
    WQLOG(@"_______");
    
    cell.textLabel.text = @"niuhao";
    
    
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}



@end

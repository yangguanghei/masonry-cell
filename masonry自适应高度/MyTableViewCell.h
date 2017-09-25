//
//  MyTableViewCell.h
//  test-自适应cell
//
//  Created by lzh on 2017/1/19.
//  Copyright © 2017年 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableModel.h"

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) MyTableModel *model;

@property (nonatomic, copy) NSString * content;
@end

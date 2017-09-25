//
//  MyTableModel.h
//  test-自适应cell
//
//  Created by lzh on 2017/1/19.
//  Copyright © 2017年 lzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTableModel : NSObject

@property (nonatomic, copy) NSString *content;

/**
 是否折叠，默认NO，折叠
 */
@property (nonatomic, assign) BOOL unfold;

@end

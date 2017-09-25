//
//  MyTableViewCell.m
//  test-自适应cell
//
//  Created by lzh on 2017/1/19.
//  Copyright © 2017年 lzh. All rights reserved.
//

IB_DESIGNABLE

#import "MyTableViewCell.h"
#import "Masonry.h"

@implementation MyTableViewCell {
    UILabel *_contentLabel;
    
    MASConstraint *_masHeight;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView {
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.backgroundColor = [UIColor orangeColor];
    _contentLabel.textColor = [UIColor purpleColor];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];

    // 布局
    [_contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        _masHeight = make.height.lessThanOrEqualTo(@50);
        make.left.equalTo(_contentLabel.superview.mas_left).with.offset(20);
        make.top.equalTo(_contentLabel.superview.mas_top).with.offset(20);
        make.right.equalTo(_contentLabel.superview.mas_right).with.offset(-20);
        make.bottom.equalTo(_contentLabel.superview.mas_bottom).with.offset(-20);
    }];
}

- (void)setContent:(NSString *)content{
    _content = content;
    _contentLabel.text = content;
}


- (void)setModel:(MyTableModel *)model {
    _model = model;
    
    _contentLabel.text = model.content;
    
    return;
    if (model.unfold) {
        _contentLabel.numberOfLines = 0;
//        [_masHeight uninstall];
    } else {
//        [_masHeight install];
        _contentLabel.numberOfLines = 3;
    }
}


@end

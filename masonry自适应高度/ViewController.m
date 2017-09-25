//
//  ViewController.m
//  masonry自适应高度
//
//  Created by 梁森 on 2017/9/25.
//  Copyright © 2017年 梁森. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MyTableViewCell.h"
#import "MyTableModel.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initTableView];
    [self initDataSource];
}

- (void)initTableView {
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.estimatedRowHeight = 20;
    [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCell"];
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    MyTableViewCell *cell = (MyTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
//    cell.model.unfold = !cell.model.unfold;
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
// 关键点：不去实现这个方法
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 30;
//}

- (void)initDataSource {
    
    NSArray *arr = @[@"我们开发中，在使用UITableView的时候经常会遇到这样的需求：table view的cell中的内容是动态的。于是我们就在table view的代理中手动去计算cell中的内容高度。这样做有两个问题",
                     @"计算代码冗长、复杂。" ,
                     @"每次 reload tableview 的时候，系统会先计算出每一个 cell 的高度，等所有高度计算完毕，确定了 tableview 的contentSize后，才开始渲染视图并显示在屏幕上。如果数据比较多，就会感受到非常明显的卡顿。" ,
                     @"所以，我们应该寻找其他的解决方案。如果你的项目只支持iOS8及以上，那么恭喜你，你只用简单的几步就可以实现自适应cell了。如果是iOS7也没关系，后面我也会讲到，如何在iOS下实现自适应cell。" ,
                     @"在讲具体的实现之前，必须得说一下iOS7中新增的一个API：" ,
                     @"-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath;",
                     @"这个方法用于返回一个 cell 的预估高度，如果实现了这个代理方法，tableview 首次加载的时候就不会调用heightForRowAtIndexPath 方法，而是用 estimatedHeightForRowAtIndexPath 返回的预估高度计算 tableview 的contentSize，然后 tableview 就可以显示出来了，等到 cell 可见的时候，再去调用heightForRowAtIndexPath 获取 cell 的正确高度。", @"wo多久啊看了几分离开的撒开发建设大街都发生了开发建设了大风附属卡地方就收到了咖啡", @"fasjdfjaslkjflksajdlfkjslkadoifwjejfksajfklsajdf ", @"阿斯科利减肥啦时间付款就撒的吉瓦阿胶哦 i 我减肥啊接口了飞机库萨的肌肤"];
    
    _dataArray = [NSMutableArray array];
    for (NSString *str in arr) {
        MyTableModel *model = [[MyTableModel alloc] init];
        model.content = str;
        [_dataArray addObject:model];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

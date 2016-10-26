//
//  MessageTableViewController.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "MessageTableViewController.h"
#import "MessageCell.h"
#import "MessageViewModel.h"

@interface MessageTableViewController ()

@end

@implementation MessageTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _messageModel.nickName;
    self.navigationItem.prompt = _messageModel.status;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:nil] forCellReuseIdentifier:[MessageCell reuseID]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageModel.chatLogs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[MessageCell reuseID] forIndexPath:indexPath];
    cell.message = [_messageModel.chatLogs[indexPath.row] objectForKey:@"content"];
    cell.icon = _messageModel.icon;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;

    return cell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = [_messageModel.chatLogs[indexPath.row] objectForKey:@"cellHeight"];
    
    return [height floatValue];
}

#pragma mark - getters

- (MessageViewModel *)messageModel {
    if (!_messageModel) {
        _messageModel = [[MessageViewModel alloc] init];
    }
    
    return _messageModel;
}

@end

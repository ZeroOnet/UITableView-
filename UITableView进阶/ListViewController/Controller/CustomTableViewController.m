//
//  CustomTableViewController.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/21.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "CustomTableViewController.h"
#import "MessageTableViewController.h"
#import "CustomHeaderView.h"
#import "FriendCell.h"
#import "ListViewModel.h"

@interface CustomTableViewController () <foldViewDelegate>

@property (nonatomic, strong) ListViewModel *viewModel;

@end

@implementation CustomTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:[FriendCell reuseID]];
    [self.tableView registerClass:[CustomHeaderView class] forHeaderFooterViewReuseIdentifier:[CustomHeaderView reuseID]];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.groupsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.groupsStatus[section] boolValue] ? [self.viewModel.aGroupFriendCounts[section] integerValue]: 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:[FriendCell reuseID] forIndexPath:indexPath];
    cell.cellModel = self.viewModel.groups[indexPath.section].friends[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // cache layer to improve preformance
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    return cell;
}

#pragma mark - Table View Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[CustomHeaderView reuseID]];
    headerView.delegate = self;
    headerView.group = self.viewModel.groups[section];
    headerView.sectionIndex = section;
    headerView.layer.shouldRasterize = YES;
    headerView.layer.rasterizationScale = [UIScreen mainScreen].scale;

    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MessageTableViewController *tableVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MsgVC"];
    tableVC.messageModel.friendMsg = self.viewModel.groups[indexPath.section].friends[indexPath.row];
    
    [self.navigationController pushViewController:tableVC animated:YES];
}

#pragma mark - Fold View Delegate

- (void)tableViewDidFoldView:(NSInteger)section {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - getters

- (ListViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ListViewModel alloc] init];
    }
    
    return _viewModel;
}

@end

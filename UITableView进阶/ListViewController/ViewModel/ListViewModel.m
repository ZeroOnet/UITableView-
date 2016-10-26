//
//  ListViewModel.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/24.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "ListViewModel.h"
#import "DataStore.h"
#import "FriendsGroups.h"

@implementation ListViewModel

@synthesize groups = _groups;
@synthesize groupsCount = _groupsCount;
@synthesize groupsStatus = _groupsStatus;
@synthesize aGroupFriendCounts = _aGroupFriendCounts;

#pragma mark - getters

- (NSArray<FriendsGroups *> *)groups {
    if (!_groups) { // lazy load
        NSArray *groupsInfo = [DataStore dataStore];
        NSMutableArray *msgGroups = [NSMutableArray array];
        for (NSDictionary *groupsMsg in groupsInfo) {
            FriendsGroups *group = [[FriendsGroups alloc] initWithGroupsMsg:groupsMsg];
            [msgGroups addObject:group];
        }
        
        _groups = msgGroups;
    }
    
    return _groups;
}

- (NSInteger)groupsCount {
    if (!_groupsCount) {
        _groupsCount = self.groups.count;
    }
    
    return _groupsCount;
}

- (NSArray<NSNumber *> *)groupsStatus {
//    if (!_groupsStatus) { // when the status of group is changed, groupsStatus should update
        NSMutableArray *statusInfo = [NSMutableArray array];
        for (FriendsGroups *group in self.groups) {
            [statusInfo addObject:@(group.isOpened)];
        }
    
        _groupsStatus = statusInfo;
//    }
    
    return _groupsStatus;
}

- (NSArray<NSNumber *> *)aGroupFriendCounts {
    if (!_aGroupFriendCounts) {
        NSMutableArray *friendCounts = [NSMutableArray array];
        for (FriendsGroups *group in self.groups) {
            [friendCounts addObject:@(group.friends.count)];
        }
        
        _aGroupFriendCounts = friendCounts;
    }
    
    return _aGroupFriendCounts;
}

@end

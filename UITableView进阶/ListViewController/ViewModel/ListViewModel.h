//
//  ListViewModel.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/24.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FriendsGroups;

@interface ListViewModel : NSObject

@property (nonatomic, strong, readonly) NSArray<FriendsGroups *> *groups;
@property (nonatomic, strong, readonly) NSArray<NSNumber *> *groupsStatus;
@property (nonatomic, strong, readonly) NSArray<NSNumber *> *aGroupFriendCounts;

@property (nonatomic, assign, readonly) NSInteger groupsCount;

@end

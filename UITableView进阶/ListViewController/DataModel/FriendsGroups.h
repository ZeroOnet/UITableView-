//
//  FriendsGroups.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsGroups : NSObject

@property (nonatomic, strong, readonly) NSArray *friends;

@property (nonatomic, copy, readonly) NSString *groupName;

@property (nonatomic, assign, readonly) NSNumber *totalPersonCount;
@property (nonatomic, assign, readonly) NSNumber *onlinePersonCount;

@property (nonatomic, assign, getter=isOpened) BOOL open;

- (instancetype)initWithGroupsMsg:(NSDictionary *)msg;

@end

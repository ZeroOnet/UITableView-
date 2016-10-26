//
//  FriendsGroups.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "FriendsGroups.h"
#import "Friend.h"

@implementation FriendsGroups

@synthesize friends = _friends;

#pragma mark - Initializer

- (instancetype)initWithGroupsMsg:(NSDictionary *)msg {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:msg];
        
        NSMutableArray *friends = [NSMutableArray array];
        for (NSDictionary *friendMsg in self.friends) {
            Friend *friend = [[Friend alloc] initWithFriendMsg:friendMsg];
            [friends addObject:friend];
        }
        
        _friends = friends;
    }
    
    return self;
}

@end

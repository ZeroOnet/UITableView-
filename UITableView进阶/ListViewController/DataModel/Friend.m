//
//  Friends.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "Friend.h"

@implementation Friend

#pragma mark - Initializer

- (instancetype)initWithFriendMsg:(NSDictionary *)msg {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:msg]; // KVC
    }
    
    return self;
}

@end

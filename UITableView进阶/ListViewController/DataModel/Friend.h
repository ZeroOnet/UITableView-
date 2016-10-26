//
//  Friends.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic, copy, readonly) NSString *iconName;
@property (nonatomic, copy, readonly) NSString *nickName;
@property (nonatomic, copy, readonly) NSString *intro;

@property (nonatomic, strong, readonly) NSArray *chatLog;

@property (nonatomic, assign, readonly, getter=isVip) BOOL vip;
@property (nonatomic, assign, readonly, getter=isOnline) BOOL online;

- (instancetype)initWithFriendMsg:(NSDictionary *)msg;

@end

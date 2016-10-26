//
//  MessageViewModel.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/24.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Friend;

@interface MessageViewModel : NSObject

@property (nonatomic, strong) Friend *friendMsg;

@property (nonatomic, copy, readonly) NSString *nickName;
@property (nonatomic, copy, readonly) NSString *status;

@property (nonatomic, strong, readonly) UIImage *icon;

@property (nonatomic, strong, readonly) NSArray<NSDictionary *> *chatLogs;

@end

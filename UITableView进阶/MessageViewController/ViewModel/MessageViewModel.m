//
//  MessageViewModel.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/24.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "MessageViewModel.h"
#import "Friend.h"

@implementation MessageViewModel

@synthesize chatLogs = _chatLogs;

#pragma mark - getters

- (NSString *)nickName {
    return _friendMsg.nickName;
}

- (NSString *)status {
    return _friendMsg.isOnline ? @"在线" : @"离线";
}

- (UIImage *)icon {
    return [UIImage imageNamed:_friendMsg.iconName];
}

- (NSArray<NSDictionary *> *)chatLogs {
    if (!_chatLogs) {
        NSMutableArray *logs = [NSMutableArray arrayWithCapacity:_friendMsg.chatLog.count];
        for (NSString * message in _friendMsg.chatLog) {
            NSAttributedString *attriMsg = [[NSAttributedString alloc] initWithString:message attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]}];
            CGRect msgSize = [attriMsg boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 136.0f, 2000.0f) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
            CGFloat cellHeight = msgSize.size.height + 62.0f;
            
            NSDictionary *logMsg = @{@"content": message, @"cellHeight":[NSNumber numberWithFloat:cellHeight]};
            [logs addObject:logMsg];
        }
        
        _chatLogs = logs;
    }
    
    return _chatLogs;
}

@end

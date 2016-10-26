//
//  MessageCell.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/25.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "MessageCell.h"

static NSString *const msgCellID = @"MSG_CELL";

@interface MessageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *messageView;

@end

@implementation MessageCell

#pragma mark - Overload Method

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Interface Method

+ (NSString *)reuseID {
    return msgCellID;
}

#pragma mark - setters

- (void)setMessage:(NSString *)message {
    [_messageView setTitle:message forState:UIControlStateNormal];
    _messageView.titleLabel.numberOfLines = 0;
}

- (void)setIcon:(UIImage *)icon {
    _iconImageView.image = icon;
}

@end

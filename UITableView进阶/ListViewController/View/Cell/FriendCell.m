//
//  FriendCell.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "FriendCell.h"
#import "Friend.h"

static NSString *const listCellID = @"LIST_CELL";

@implementation FriendCell

#pragma mark - Initializer

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Interface Method

+ (NSString *)reuseID {
    return listCellID;
}

#pragma mark - getters and setters

- (void)setCellModel:(Friend *)cellModel {
    if (_cellModel != cellModel) {
        _cellModel = cellModel;
        
        self.imageView.image = [UIImage imageNamed:cellModel.iconName];
        self.textLabel.text = cellModel.nickName;
        self.textLabel.textColor = cellModel.isOnline ? (cellModel.isVip ? [UIColor redColor] : [UIColor blackColor]) : [UIColor lightGrayColor];
        self.detailTextLabel.text = cellModel.intro;
    }
}

@end

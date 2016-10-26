//
//  FriendCell.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Friend;

@interface FriendCell : UITableViewCell

@property (nonatomic, strong) Friend *cellModel;

+ (NSString *)reuseID;

@end

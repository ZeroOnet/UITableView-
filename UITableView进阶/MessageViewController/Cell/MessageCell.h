//
//  MessageCell.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/25.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) UIImage *icon;

+ (NSString *)reuseID;

@end

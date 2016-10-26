//
//  MessageTableViewController.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageViewModel.h"

@interface MessageTableViewController : UITableViewController

@property (nonatomic, strong) MessageViewModel *messageModel;

@end

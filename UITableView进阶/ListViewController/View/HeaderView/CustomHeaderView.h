//
//  CustomHeaderView.h
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/21.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsGroups.h"

@protocol foldViewDelegate <NSObject>

@required

- (void)tableViewDidFoldView:(NSInteger)section;

@end

@interface CustomHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) FriendsGroups *group;

@property (nonatomic, assign) NSInteger sectionIndex;

@property (nonatomic, weak) id<foldViewDelegate> delegate;

+ (NSString *)reuseID;

@end

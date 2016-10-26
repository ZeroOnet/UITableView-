//
//  DataStore.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/22.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

#pragma mark - Interface Method

+ (NSArray *)dataStore {
    NSArray *groupsData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"groups" ofType:@"plist"]];
    
    return groupsData;
}

@end

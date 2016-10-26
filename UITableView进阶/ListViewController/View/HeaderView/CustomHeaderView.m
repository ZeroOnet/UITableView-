//
//  CustomHeaderView.m
//  UITableView进阶
//
//  Created by FunctionMaker on 2016/10/21.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "CustomHeaderView.h"
#import "FriendsGroups.h"
#import <Masonry.h>

static NSString *const headerViewID = @"headerCELL";

@interface CustomHeaderView()

@property (nonatomic, strong) UIImageView *listIcon;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *groupNameLabel;
@property (nonatomic, strong) UILabel *personCountLabel;

@property (nonatomic, strong) UIButton *viewTouched;

@end

@implementation CustomHeaderView

#pragma mark - Initializer

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.listIcon];
        [self.contentView addSubview:self.groupNameLabel];
        [self.contentView addSubview:self.personCountLabel];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.viewTouched];
    }
    
    return self;
}

#pragma mark - Layout Subviews

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.listIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.leading.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(7, 11));
    }];
    
    [self.groupNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leadingMargin.equalTo(self.listIcon).mas_equalTo(22);
        make.centerY.equalTo(self.listIcon);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(187);
    }];
    
    [self.personCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailingMargin.equalTo(self).mas_equalTo(0);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        //make.width.mas_equalTo(50);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    [self.viewTouched mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - Interface Method

+ (NSString *)reuseID {
    return headerViewID;
}

#pragma mark - Private  Method

- (void)handleTouched:(UIButton *)sender {
    self.group.open = !self.group.isOpened;
    
    if ([_delegate respondsToSelector:@selector(tableViewDidFoldView:)]) {
        [_delegate tableViewDidFoldView:self.sectionIndex];
    }
}

#pragma mark - getters and setters

- (UIImageView *)listIcon {
    if (!_listIcon) {
        _listIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"listIcon"]];
        _listIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _listIcon;
}

- (UILabel *)groupNameLabel {
    if (!_groupNameLabel) {
        _groupNameLabel = [[UILabel alloc] init];
        _groupNameLabel.text = @"我是组名怎么滴";
    }
    
    return _groupNameLabel;
}

- (UILabel *)personCountLabel {
    if (!_personCountLabel) {
        _personCountLabel = [[UILabel alloc] init];
        _personCountLabel.text = @"12/12";
        _personCountLabel.textColor = [UIColor grayColor];
        _personCountLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _personCountLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    
    return _lineView;
}

- (UIButton *)viewTouched {
    if (!_viewTouched) {
        _viewTouched = [UIButton buttonWithType:UIButtonTypeSystem];
        _viewTouched.backgroundColor = [UIColor clearColor];
        
        [_viewTouched addTarget:self action:@selector(handleTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _viewTouched;
}

- (void)setGroup:(FriendsGroups *)group {
    if (_group != group) {
        _group = group;
        
        self.groupNameLabel.text = _group.groupName;
        self.personCountLabel.text = [NSString stringWithFormat:@"%@/%@", _group.onlinePersonCount, _group.totalPersonCount];
    }
    
    CGFloat angle = self.group.open ? M_PI_2 : 0;
    self.listIcon.transform = CGAffineTransformMakeRotation(angle);
}

@end

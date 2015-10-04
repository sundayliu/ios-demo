//
//  ViewController.m
//  HeaderViewDemo
//
//  Created by Rannie on 13-9-8.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import "ViewController.h"
#import "HRFriendsCell.h"
#import "HeaderButton.h"

#define RTagOffset 10
#define RRowHeight 50.0f
#define RHeaderHeight 45.0f

@interface ViewController ()
{
    NSArray *_dataList;
    NSMutableArray *_groupNames;
    
    NSMutableDictionary *_headers;
}
@end

static NSString * const CellIdentifier = @"FriendCell";
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
    self.title = @"好友分组";
    [self.tableView registerClass:[HRFriendsCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)loadData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
    _dataList = [NSArray arrayWithContentsOfFile:path];
    _headers = [NSMutableDictionary dictionaryWithCapacity:_dataList.count];
    
    _groupNames = [NSMutableArray arrayWithCapacity:_dataList.count];
    for (NSInteger i = 0; i < _dataList.count; i++)
    {
        NSDictionary *dict = _dataList[i];
        [_groupNames addObject:dict[@"groupname"]];
    }
}

- (NSArray *)arrayWithSection:(NSInteger)number
{
    NSDictionary *dict = _dataList[number];
    NSArray *friendsArray = dict[@"list"];
    
    return friendsArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _groupNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HeaderButton *header = _headers[@(section)];
    NSArray *array = [self arrayWithSection:section];
    NSInteger count = header.isOpen?array.count:0;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HRFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSArray *array = [self arrayWithSection:indexPath.section];
    [cell bindFriend:array[indexPath.row]];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderButton *header = _headers[@(section)];
    if (!header)
    {
        header = [HeaderButton buttonWithType:UIButtonTypeCustom];
        header.bounds = CGRectMake(0, 0, 320, RHeaderHeight);
        header.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.8 alpha:1.0];
        header.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        NSString *title = _groupNames[section];
        [header setTitle:title forState:UIControlStateNormal];
        [header addTarget:self action:@selector(expandFriends:) forControlEvents:UIControlEventTouchUpInside];
        [_headers setObject:header forKey:@(section)];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return RHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RRowHeight;
}

- (void)expandFriends:(HeaderButton *)header
{
    header.open = !header.isOpen;
    [self.tableView reloadData];
}

@end

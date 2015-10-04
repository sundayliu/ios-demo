//
//  HRFriendsCell.h
//  HeaderViewDemo
//
//  Created by Rannie on 13-9-8.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import "HRTableCell.h"

@interface HRFriendsCell : HRTableCell
@property (weak, nonatomic) NSString *name;
@property (assign, nonatomic, getter = isOnline) BOOL online;
@property (weak, nonatomic) UIImage *headerImage;
- (void)bindFriend:(NSDictionary *)myFriend;
@end

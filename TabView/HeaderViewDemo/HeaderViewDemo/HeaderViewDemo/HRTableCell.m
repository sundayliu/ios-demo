//
//  HRTableCell.m
//  HeaderViewDemo
//
//  Created by Rannie on 13-9-8.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import "HRTableCell.h"

@interface HRTableCellView : UIView
@end

@implementation HRTableCellView

- (void)drawRect:(CGRect)rect
{
    [(HRTableCell *)[self superview] drawContentView:rect];
}

@end

@implementation HRTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        contentView = [[HRTableCellView alloc] init];
        contentView.opaque = YES;
        [self addSubview:contentView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    CGRect b = self.bounds;
    b.size.height -= 1.0f;
    contentView.frame = b;
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    [contentView setNeedsDisplay];
}

- (void)drawContentView:(CGRect)rect
{
    
}

@end

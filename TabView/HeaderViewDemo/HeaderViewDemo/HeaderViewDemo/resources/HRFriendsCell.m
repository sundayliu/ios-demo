//
//  HRFriendsCell.m
//  HeaderViewDemo
//
//  Created by Rannie on 13-9-8.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import "HRFriendsCell.h"

#define RTitleSize 16.0f
#define RDetailSize 12.0f

static UIFont * TextFont = nil;
@implementation HRFriendsCell

+ (void)initialize
{
    TextFont = [UIFont fontWithName:@"American Typewriter" size:RTitleSize];
}

- (void)bindFriend:(NSDictionary *)myFriend
{
    _name = myFriend[@"name"];
    _online = [myFriend[@"isonline"] boolValue];
    _headerImage = [UIImage imageNamed:myFriend[@"imagename"]];
    
    [self setNeedsDisplay];
}

- (void)drawContentView:(CGRect)rect
{
    UIColor *titleColor;
    titleColor = [UIColor blackColor];
    UIColor *detailColor;
    detailColor = [UIColor lightGrayColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGSize size = self.frame.size;
    if (self.selected || self.highlighted)
    {
        CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0].CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    }
    else
    {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    }

    [_headerImage drawInRect:CGRectMake(5, 5, 40, 40)];
    
    [titleColor set];
    [_name drawAtPoint:CGPointMake(50, 5)
              forWidth:200
              withFont:TextFont
              fontSize:RTitleSize
         lineBreakMode:NSLineBreakByTruncatingTail
    baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
    
    [detailColor set];
    NSString *detailString;
    if (self.isOnline)
    {
        detailString = @"[在线]";
    }
    else
    {
        detailString = @"[不在线]";
    }
    [detailString drawAtPoint:CGPointMake(50, 28)
                     forWidth:100
                     withFont:TextFont
                     fontSize:RDetailSize
                lineBreakMode:NSLineBreakByTruncatingTail
           baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
}

@end

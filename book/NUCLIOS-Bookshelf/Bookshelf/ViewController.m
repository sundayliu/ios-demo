//
//  ViewController.m
//  Bookshelf
//
//  Created by Steve Zaharuk on 11/9/12.
//  Copyright (c) 2012 com.infragistics. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray* data = [[NSMutableArray alloc]init];
    for(int i = 1; i <= 26; i++)
    {
        Data* photoInfo = [[Data alloc]init];
        photoInfo.imgName = [NSString stringWithFormat:@"thumb%d.jpeg", i];
        [data addObject:photoInfo];
    }
    
    IGGridViewImageColumnDefinition* col = [[IGGridViewImageColumnDefinition alloc]initWithKey:@"thumbnail" forPropertyType:IGGridViewImageColumnDefinitionPropertyTypeImage];
    
    col.loadAsync = YES;
    
    _ds = [[IGGridViewSingleFieldMultiColumnDataSourceHelper alloc]initWithField:col];
    _ds.numberOfColumns = 4;
    _ds.data = data;
    
    _gridView = [[IGGridView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _gridView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:_gridView];
    
    _gridView.headerHeight = 0;
    _gridView.selectionType = IGGridViewSelectionTypeNone;
    
    _gridView.delegate = self;
    _gridView.rowHeight = 100;
    _gridView.rowSeparatorHeight = 50;
    _gridView.cellContentInset = UIEdgeInsetsMake(30, 10, 0, 15);
    
    
    UIImageView* bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Bookcase_Universal_TOP"]];
    bg.contentMode = UIViewContentModeScaleToFill;
    _gridView.backgroundView = bg;
    
    _gridView.dataSource = _ds;
    
}

-(UIView *)gridView:(IGGridView *)gridView viewForRowSeparatorAtPath:(IGRowPath *)path
{
    NSString * imgPath = (path.rowIndex == 0)? @"Bookcase_Universal_TopShelf.png" : @"Bookcase_Universal.png";
    
    UIImageView* iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgPath]];
    iv.contentMode = UIViewContentModeScaleToFill;
    return iv;

}

-(UIView *)gridView:(IGGridView *)gridView viewForRowBackgroundAtPath:(IGRowPath *)path
{
    NSString* imgName = (path.rowIndex == 0) ? @"Bookcase_Universal_toptall.png" : @"Bookcase_Universal_white_withBG.png";
    UIView* container = [[UIView alloc]init];
    UIImageView* iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
    iv.contentMode = UIViewContentModeScaleToFill;
    iv.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    iv.frame = CGRectMake(0, -5, 0, 0);
    [container addSubview:iv];
    return container;
}


@end


@implementation Data

-(UIImage *)thumbnail
{
    return [UIImage imageNamed:[self imgName]];
}

@end

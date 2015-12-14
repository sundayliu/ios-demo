//
//  ViewController.h
//  Bookshelf
//
//  Created by Steve Zaharuk on 11/9/12.
//  Copyright (c) 2012 com.infragistics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IG/IG.h>

@interface ViewController : UIViewController<IGGridViewDelegate>
{
    IGGridView* _gridView;
    IGGridViewSingleFieldMultiColumnDataSourceHelper* _ds;
}
@end

@interface Data : NSObject

@property(nonatomic, readonly)UIImage* thumbnail;
@property(nonatomic, retain)NSString* imgName;

@end

//
//  ViewController.m
//  FloatMenu
//
//  Created by Johnny on 14/9/6.
//  Copyright (c) 2014年 Johnny. All rights reserved.
//

#import "ViewController.h"
#import "FloatView.h"
@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)action_push:(id)sender {
//    [self.navigationController pushViewController:[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil] animated:YES];
    [_textField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(boardButtonClick:) name:FloatViewClickNotification object:nil];
}

- (void)boardButtonClick:(NSNotification*)center
{
    NSString * message = [NSString stringWithFormat:@"点击第%@个按钮",[center object]];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"通知" message:message delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

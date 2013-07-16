//
//  RootVC.m
//  UITest
//
//  Created by nn on 13-7-16.
//  Copyright (c) 2013年 ssn. All rights reserved.
//

#import "RootVC.h"

@implementation RootVC

- (void)viewDidLoad {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(80, 130, 160, 88)];
    [button setTitle:@"Test Button" forState:UIControlStateNormal];
    // Image with without cap insets
    UIImage *buttonImage = [[UIImage imageNamed:@"blueButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [[self view] addSubview:button];
    
    UIButton *buttonAuto = [[UIButton alloc] initWithFrame:CGRectMake(80, 0, 144, 144)];
    [buttonAuto setTitle:@"this is a anoying button" forState:UIControlStateNormal];
    UIImage *buttonAutoImage = [[UIImage imageNamed:@"blueButtonHighlight"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [buttonAuto setBackgroundImage:buttonAutoImage forState:UIControlStateNormal];
    [buttonAuto setContentMode:UIViewContentModeScaleAspectFill];
    [[self view] addSubview:buttonAuto];
    
    //初始化label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
    //设置自动行数与字符换行
    [label setNumberOfLines:0];
    label.lineBreakMode = UILineBreakModeWordWrap;
    // 测试字串
    NSString *s = @"这是一个测试！！！adsfsaf时发生发勿忘我勿忘我勿忘我勿忘我勿忘我阿阿阿阿阿阿阿阿阿阿阿阿阿啊00000000阿什顿。。。";
    UIFont *font = [UIFont fontWithName:@"Arial" size:12];
    //设置一个行高上限
    CGSize size = CGSizeMake(320,200);
    //计算实际frame大小，并将label的frame变成实际大小
    CGSize labelsize = [s sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    [label setFrame:CGRectMake(0, 0, labelsize.width, labelsize.height)];
    [label setBackgroundColor:[UIColor purpleColor]];
    [[self view] addSubview:label];

}

- (void)buttonPressed:(UIEvent *)event {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"点击"
                                                    message:@"确定订阅？"
                                                   delegate:self
                                          cancelButtonTitle:@"cancel"
                                          otherButtonTitles:@"confirm", nil];
    [alert show];
    alert = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"first button");
    } else {
        NSLog(@"second button");
    }
}
@end

//
//  RootVC.m
//  UITest
//
//  Created by nn on 13-7-16.
//  Copyright (c) 2013年 ssn. All rights reserved.
//

#import "RootVC.h"
@interface RootVC ()

@property (nonatomic, retain)UITextView *textView;

@end

@implementation RootVC
@synthesize textView;

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
    
    //自适应内容的label one
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [label setFont:font];
    [label setNumberOfLines:0];
    NSString *text = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(100.0f, 200.0f) lineBreakMode:UILineBreakModeWordWrap];
    CGRect rect = label.frame;
    rect.size = size;
    [label setFrame:rect];
    [label setText:text];
    [label setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:label];
    //自适应内容的label two
    UILabel *labelTwo = [[UILabel alloc] init];
    labelTwo.text = @"I am the very model of a modern Major-General, I've information vegetable, animal, and mineral";
    labelTwo.frame = CGRectMake(20, 280, 280, 150);
    labelTwo.textAlignment = UITextAlignmentCenter;
    //-- 下面两句的顺序有关系
    [labelTwo setNumberOfLines:0];
    [labelTwo sizeToFit];
    //-- 重新设置frame让内容对齐
    CGRect myFrame = labelTwo.frame;
    myFrame = CGRectMake(myFrame.origin.x, myFrame.origin.y,
                         280, myFrame.size.height);
    labelTwo.frame = myFrame;
    [labelTwo setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:labelTwo];
    
    label = nil;
    labelTwo = nil;
    
    //uitextview
    textView = [[UITextView alloc] init];
    textView.text = @"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.1.sdk/System/Library/PrivateFrameworks/ChatKit.framework";
    textView.frame = CGRectMake(20, 380, 280, 50);
    CGRect textImageFrame = CGRectMake(0, 0, 280, 380);
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:textImageFrame];
    imageView.image = [[UIImage imageNamed:@"Balloon_1"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    textView.backgroundColor = [UIColor grayColor];
    textView.delegate = self;
    [textView addSubview:imageView];
    [textView sendSubviewToBack:imageView];
    [self.view addSubview:textView];

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

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeContentViewPoint:) name:UIKeyboardWillShowNotification object:nil];

}

// 根据键盘状态，调整_mainView的位置
- (void) changeContentViewPoint:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;  // 得到键盘弹出后的键盘视图所在y坐标
    
    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // 添加移动动画，使视图跟随键盘移动
    [UIView animateWithDuration:duration.doubleValue animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];
        
        
        textView.center = CGPointMake(textView.center.x, keyBoardEndY - textView.bounds.size.height/2.0);   // keyBoardEndY的坐标包括了状态栏的高度，要减去
        
    }];
    
}

- (BOOL)textView:(UITextView *)textView2 shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView2 resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end

//
//  AddItemViewController.m
//  CheckListDemo
//
//  Created by sunydea on 14-3-7.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "CheckItem.h"

@interface ItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end

@implementation ItemDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     [self.textField becomeFirstResponder];
    if (self.itemToEdit) {
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.delegate ItemDetailViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    if (self.itemToEdit) {// add new
        self.itemToEdit.text = self.textField.text;
        [self.delegate ItemDetailViewController:self didFinishEditingItem:self.itemToEdit];
    }else {
        CheckItem *item = [[CheckItem alloc] init];
        item.text = self.textField.text;
        item.checked = NO;
        [self.delegate ItemDetailViewController:self didFinishAddingItem:item];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newText length] >0) {
        self.doneBarButton.enabled = YES;
    }else {
        self.doneBarButton.enabled = NO;
    }
    
    return YES;
}
@end

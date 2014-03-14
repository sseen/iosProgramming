//
//  IconPickerViewController.m
//  CheckListDemo
//
//  Created by sunydea on 14-3-14.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "IconPickerViewController.h"

@interface IconPickerViewController ()

@end

@implementation IconPickerViewController {
    NSArray *_icons;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _icons = @[@"Icon-Small",
               @"diamond",
               @"calendar"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_icons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IconCell"];
    NSString *icon = _icons[indexPath.row];
    
    cell.textLabel.text = icon;
    cell.imageView.image = [UIImage imageNamed:icon];
    return cell;
}
@end

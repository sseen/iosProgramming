//
//  ViewController.m
//  CheckListDemo
//
//  Created by sunydea on 14-3-6.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "ViewController.h"
#import "CheckItem.h"

@interface ViewController ()
- (IBAction)addItem:(id)sender;

@end

@implementation ViewController {
    NSMutableArray *_items;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _items = [[NSMutableArray alloc] initWithCapacity:20];
    CheckItem *item;
    
    item = [[CheckItem alloc] init];
    item.text = @"观看嫦娥⻜飞天和⽟玉兔升空的视频";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[CheckItem alloc] init];
    item.text = @"了解Sony a7和MBP的最新价格";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[CheckItem alloc]init];
    item.text =@"复习苍⽼老师的经典视频教程";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[CheckItem alloc]init];
    item.text =@"去电影院看地⼼心引⼒力";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[CheckItem alloc]init];
    item.text =@"看⻄西甲巴萨新败的⽐比赛回放";
    item.checked = NO;
    [_items addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview face
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listItem"];
    CheckItem *item = _items[indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CheckItem *item = _items[indexPath.row];
    item.checked = !item.checked;
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath*)indexPath{
    
    CheckItem *item = _items[indexPath.row];
    if(item.checked){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    } 
    
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(CheckItem *)item {
    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(CheckItem *)item {
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}

- (IBAction)addItem:(id)sender {
    NSInteger newRowIndex = [_items count];
    CheckItem *item = [[CheckItem alloc] init];
    item.text = @"我是新来的";
    item.checked = NO;
    [_items addObject:item];
    // get the newRow indexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    // can be insert many cells one time
    NSArray *indexPaths = @[indexPath];
    // insert
    [self.tableView insertRowsAtIndexPaths:indexPaths
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end

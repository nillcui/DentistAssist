//
//  HomeViewController.m
//  TestTable
//
//  Created by nillcui on 15/5/19.
//  Copyright (c) 2015年 nillcui. All rights reserved.
//

#import "HomeViewController.h"
#import "CalendarManager.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    
    //左按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selectLeftAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    //右按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(selectRightAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    //TableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];
    [self.view bringSubviewToFront:self.tableView];
    [self.tableView reloadData];
    
    NSLog(@"isAuthSuccess=%d,isDenied=%d",[[CalendarManager sharedInstance] isAuthSuccess],[[CalendarManager sharedInstance] isAuthDenied]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)selectLeftAction:(id)sender {
    NSLog(@"left clicked");
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)selectRightAction:(id)sender {
    NSLog(@"right clicked");
    [[CalendarManager sharedInstance] addEvent:@"this is title" notes:@"do sth now" startTime:[[NSDate alloc] init] ];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"demo_tableview_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

#pragma mark UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}
@end

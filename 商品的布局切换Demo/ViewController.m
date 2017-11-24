//
//  ViewController.m
//  商品的布局切换Demo
//
//  Created by bailing on 2017/11/23.
//  Copyright © 2017年 bailing. All rights reserved.
//

#import "ViewController.h"
#import "HomeListViewController.h"
#import "HomeCollectionViewController.h"
#import "HomeFlowViewController.h"
#import "MainViewController.h"
#import "FlowViewController.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
//Edit的东西
- (IBAction)onClickEditCollectionViewBtn:(UIButton *)sender {
    MainViewController *editVc = [[MainViewController alloc]init];
    [self.navigationController pushViewController:editVc animated:YES];
}
//LIST
- (IBAction)onClickChangeTypeBtn:(UIButton *)sender {
    HomeListViewController *listVc = [[HomeListViewController alloc]init];
    [self.navigationController pushViewController:listVc animated:YES];
}
//METHOD
- (IBAction)onClickCollectionViewMethodBtn:(id)sender {
    HomeCollectionViewController *collectionVc = [[HomeCollectionViewController alloc]init];
    [self.navigationController pushViewController:collectionVc animated:YES];
}
//FLOW
- (IBAction)onClickCollectFlowBtn:(id)sender {
    FlowViewController *flowVc = [[FlowViewController alloc]init];
    [self.navigationController pushViewController:flowVc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

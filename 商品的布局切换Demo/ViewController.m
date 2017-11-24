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
@interface ViewController ()
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    HomeFlowViewController *flowVc = [[HomeFlowViewController alloc]init];
    [self.navigationController pushViewController:flowVc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

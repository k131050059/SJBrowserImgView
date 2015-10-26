//
//  ViewController.m
//  SJBrowserImgView
//
//  Created by jinlong sheng on 15/10/26.
//  Copyright © 2015年 sjl. All rights reserved.
//

#import "ViewController.h"
#import "SJPhotoBrowserController.h"
@interface ViewController (){
    NSArray *imgArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imgArr=@[@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B5\/jNIEjVYtl92AahLIAACVnoX3GIc676.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B5\/jNIEjVYtl-2AKny_AACVofseWmU515.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B5\/jNIEjVYtmAKAXEq9AACWaTsKgjA005.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B5\/jNIEjVYtmA2AF4SGAACcYg3OcDE868.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B6\/jNIEjVYtmCaAYMOOAACnj_skPT4487.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M00\/2D\/B6\/jNIEjVYtmDSAVTtiAAClTC-FtUM898.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B6\/jNIEjVYtmDaAPn-FAACqqaE3esE436.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M00\/2D\/B6\/jNIEjVYtmDiAAaonAACurbCd8Z0172.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B6\/jNIEjVYtmGCAdWANAACVnoX3GIc823.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M00\/2D\/B6\/jNIEjVYtmGGATdJjAACVofseWmU326.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B6\/jNIEjVYtmGGAZydMAACWaTsKgjA711.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B6\/jNIEjVYtmGKARQ9HAACcYg3OcDE612.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M00\/2D\/B6\/jNIEjVYtmGOANIFBAACnj_skPT4382.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M01\/2D\/B6\/jNIEjVYtmGWAB26fAAClTC-FtUM397.jpg",@"http:\/\/t2.auto.soooner.com\/group4\/M00\/2D\/B6\/jNIEjVYtmGaAbEocAACqqaE3esE523.jpg"];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 80)];
    btn.backgroundColor =[UIColor blueColor];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)btnclick{
    SJPhotoBrowserController *con=[[SJPhotoBrowserController alloc]init];
    con.urlArry=imgArr;
    con.currentImageIndex=0;
    [self presentViewController:con animated:YES completion:NULL];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

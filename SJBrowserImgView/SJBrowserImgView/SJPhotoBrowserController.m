//
//  SJPhotoBrowserController.m
//  carnetworking
//
//  Created by jinlong sheng on 15/10/21.
//  Copyright © 2015年 soooner. All rights reserved.
//

#import "SJPhotoBrowserController.h"
#import "SJBrowserImgView.h"
@interface SJPhotoBrowserController ()<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    
    BOOL _hasShowedFistView;
}

@end

@implementation SJPhotoBrowserController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden  =  YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden  =  NO;
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    
}
-(BOOL)shouldAutorotate{
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskLandscapeRight;
}
- (void)photoClick:(UITapGestureRecognizer *)recognizer
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imageViewDoubleTaped:(UITapGestureRecognizer *)recognizer{
    
    SJBrowserImgView *imageView = _scrollView.subviews[self.currentImageIndex];
    CGFloat scale;
    if (imageView.isScaled) {
        scale = 1.0;
    } else {
        scale = 2.0;
    }
    
    [imageView doubleTapToZommWithScale:scale];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    _scrollView.delegate=self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:_scrollView];
    for (int i=0; i<self.urlArry.count; i++) {
        SJBrowserImgView *imgView=[[SJBrowserImgView alloc]init];
        imgView.tag=i;
        
        [_scrollView addSubview:imgView];
        
    }
    
    CGRect rect = self.view.bounds;
    rect.size.width += 10 * 2;
    
    CGFloat y = 0;
    CGFloat w = _scrollView.frame.size.width ;
    CGFloat h = _scrollView.frame.size.height;
    
    [_scrollView.subviews enumerateObjectsUsingBlock:^(SJBrowserImgView *obj, NSUInteger idx, BOOL *stop) {
        CGFloat x =   idx *  w;
        obj.frame = CGRectMake(x, y, w, h);
    }];
    
    _scrollView.contentSize = CGSizeMake(_scrollView.subviews.count * _scrollView.frame.size.width, 0);
    _scrollView.contentOffset = CGPointMake(self.currentImageIndex * _scrollView.frame.size.width, 0);
    
 
    // 单击图片
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoClick:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDoubleTaped:)];
    doubleTap.numberOfTapsRequired = 2;
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    [self.view addGestureRecognizer:singleTap];
    [self.view addGestureRecognizer:doubleTap];
  

    
    [self setupImageOfImageViewForIndex:self.currentImageIndex];
    
  
}
// 加载图片
- (void)setupImageOfImageViewForIndex:(NSInteger)index
{
    SJBrowserImgView *imageView = _scrollView.subviews[index];
    self.currentImageIndex = index;
    if (imageView.hasLoadedImage){
        return;
    }else{
        [imageView setImageWithURL:[NSURL URLWithString:[self.urlArry objectAtIndex:index]] placeholderImage:[UIImage imageNamed:@"Monitor_holderImg.png"]];
     
        imageView.hasLoadedImage = YES;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = (scrollView.contentOffset.x + _scrollView.bounds.size.width * 0.5) / _scrollView.bounds.size.width;
    
    CGFloat margin = 150;
    CGFloat x = scrollView.contentOffset.x;
    if ((x - index * self.view.bounds.size.width) > margin || (x - index * self.view.bounds.size.width) < - margin) {
        SJBrowserImgView *imageView = _scrollView.subviews[index];
        if (imageView.isScaled) {
            [UIView animateWithDuration:0.5 animations:^{
                imageView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [imageView clearScale];
            }];
        }
    }
 
    [self setupImageOfImageViewForIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

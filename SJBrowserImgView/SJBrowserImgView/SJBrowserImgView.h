//
//  SJBrowserImgView.h
//  carnetworking
//
//  Created by jinlong sheng on 15/10/21.
//  Copyright © 2015年 soooner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJBrowserImgView : UIImageView<UIGestureRecognizerDelegate>
@property (nonatomic, assign, readonly) BOOL isScaled;
@property (nonatomic, assign) BOOL hasLoadedImage;

- (void)clearScale; // 清除缩放

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)doubleTapToZommWithScale:(CGFloat)scale;

@end

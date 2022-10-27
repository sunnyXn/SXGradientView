//
//  SXCircleProgressView.h
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import <UIKit/UIKit.h>



@interface SXCircleProgressView : UIView

/// 是否禁用隐式动画，默认不禁用
@property(nonatomic, assign) BOOL disableAnimation;

/// 圆环宽度，默认10.0
@property(nonatomic, assign) CGFloat lineWidth;

/// 背景颜色
@property(nonatomic, strong) UIColor *backColor;

/// 填充颜色
@property(nonatomic, strong) UIColor *fillColor;

/// 进度 0-100; 根据宽度计算
@property(nonatomic, assign) CGFloat progress;


/// 重绘
- (void)drawViews;

@end



//
//  SXCircleGradientProgressView.h
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import <UIKit/UIKit.h>



@interface SXCircleGradientProgressView : UIView

/// 是否禁用隐式动画，默认不禁用
@property(nonatomic, assign) BOOL disableAnimation;

/// 圆环宽度，默认10.0
@property(nonatomic, assign) CGFloat lineWidth;

/// 背景颜色
@property(nonatomic, strong) UIColor *backColor;

/// 渐变数组 CGColorRef，默认red—white
@property(nonatomic, copy) NSArray *colors;

/// 渐变分隔 默认 [0,1] ，分割数量与colors一致
@property(nonatomic, copy) NSArray<NSNumber *> *locations;

/// 进度 0-100; 根据宽度计算
@property(nonatomic, assign) CGFloat progress;


/// 重绘
- (void)drawViews;

@end



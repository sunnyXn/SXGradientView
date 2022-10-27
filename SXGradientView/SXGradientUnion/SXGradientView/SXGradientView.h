//
//  SXGradientView.h
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import <UIKit/UIKit.h>
#import "SXGradientHeader.h"

/// location 方向矩阵
/**
       0,0                                  1,0
        ******************
        *                                  *
        *                                  *
        *                                  *
        *                                  *
        ******************
       0,1                                  1,1
 */


/**
 渐变view方向类型, 默认垂直从上到下
 */
typedef NS_ENUM(NSUInteger, SXGradientDirectionType) {
    /// 垂直从上到下
    SXGradientDirectionTypeVerticallyUpToDown        = 0,
    
    /// 从左上到右下
    SXGradientDirectionTypeLeftUpToRightDown         = 1 <<  1,
    
    /// 水平从左到右
    SXGradientDirectionTypeHorizontallyLeftToRight   = 1 <<  2,
    
    /// 垂直从下到上
    SXGradientDirectionTypeVerticallyDownToUp        = 1 <<  3,
    
    /// 从左下到右上
    SXGradientDirectionTypeLeftDownToRightUp         = 1 <<  4,
    
    /// 水平从右到左
    SXGradientDirectionTypeHorizontallyRightToLeft   = 1 <<  5,
    
    /// 从右下到左上
    SXGradientDirectionTypeoRightDownToLeftUp        = 1 <<  6,
    
    /// 从右上到左下
    SXGradientDirectionTypeLeftRightToUpDown         = 1 <<  7,
};


@interface SXGradientView : UIView

/// 是否禁用隐式动画，默认不禁用
@property(nonatomic, assign) BOOL disableAnimation;

/// 渐变数组 CGColorRef，默认red—green
@property(nonatomic, copy) NSArray *colors;

/// 渐变分隔 默认 [0,1] ，分割数量与colors一致
@property(nonatomic, copy) NSArray<NSNumber *> *locations;

/// 渐变方向，默认 SXGradientDirectionTypeVerticallyUpToDown
@property(nonatomic, assign) SXGradientDirectionType gradientDirectionType;


/// 重绘
- (void)drawViews;


@end



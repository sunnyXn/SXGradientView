//
//  UIView+Animation.h
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import <UIKit/UIKit.h>


/// 禁用动画的几种方式
@interface UIView (Animation)


- (void)executeWithoutAnimation:(dispatch_block_t)block;

- (void)processWithoutAnimation:(dispatch_block_t)block;

- (void)transactionWithoutAnimation:(dispatch_block_t)block;



- (void)execute:(dispatch_block_t)block withAnimation:(BOOL)animated;

- (void)process:(dispatch_block_t)block withAnimation:(BOOL)animated;

- (void)transaction:(dispatch_block_t)block withAnimation:(BOOL)animated;


@end




@interface NSObject (InvokeBlock)

- (void)invokeBlock:(dispatch_block_t)block;

@end


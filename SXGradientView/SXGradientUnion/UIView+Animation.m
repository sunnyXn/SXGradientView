//
//  UIView+Animation.m
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)


#pragma mark - 不执行动画
/// 不执行动画，+ [uiview performWithoutAnimation:]
- (void)executeWithoutAnimation:(dispatch_block_t)block {
    [UIView performWithoutAnimation:block];
}

/// 不执行动画，+ [uiview setAnimationsEnabled:]
- (void)processWithoutAnimation:(dispatch_block_t)block {
    BOOL animationEnable = [UIView areAnimationsEnabled];
    if (animationEnable) {
        [UIView setAnimationsEnabled:NO];
    }
    [self invokeBlock:block];
    if (animationEnable) {
        [UIView setAnimationsEnabled:YES];
    }
}

/// 不执行动画，+ [CATransaction setDisableActions:]
- (void)transactionWithoutAnimation:(dispatch_block_t)block {
    BOOL disableActions = [CATransaction disableActions];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self invokeBlock:block];
    [CATransaction setCompletionBlock:^{
        if (!disableActions) {
            [CATransaction setDisableActions:NO];
        }
    }];
    [CATransaction commit];
}


#pragma mark - 是否执行动画
- (void)execute:(dispatch_block_t)block withAnimation:(BOOL)animated {
    if (animated) {
        [self invokeBlock:block];
    } else {
        [self executeWithoutAnimation:block];
    }
}

- (void)process:(dispatch_block_t)block withAnimation:(BOOL)animated {
    if (animated) {
        [self invokeBlock:block];
    } else {
        [self processWithoutAnimation:block];
    }
}

- (void)transaction:(dispatch_block_t)block withAnimation:(BOOL)animated {
    if (animated) {
        [self invokeBlock:block];
    } else {
        [self transactionWithoutAnimation:block];
    }
}

@end



@implementation NSObject (InvokeBlock)

- (void)invokeBlock:(dispatch_block_t)block {
    if (!block)  return;
    
    @try {
        if (block) {
            block();
        }
    } @catch (NSException *exception) {
        // Handle an exception thrown in the @try block
    } @finally {
        // Code that gets executed whether or not an exception is thrown
    }
}

@end




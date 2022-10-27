//
//  SXGradientView.m
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import "SXGradientView.h"



@interface SXGradientView ()

@property(nonatomic, strong) CAGradientLayer *gradientLayer;
@property(nonatomic, assign) CGPoint pointStart;
@property(nonatomic, assign) CGPoint pointEnd;

@end


@implementation SXGradientView

#pragma mark - lifecycle
- (void)dealloc {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_init];
    }
    return self;
}

#pragma mark - custom init
- (void)p_init {
    self.backgroundColor = UIColor.clearColor;
    self.layer.masksToBounds = YES;
    
    self.colors = @[(id)UIColor.redColor.CGColor, (id)UIColor.greenColor.CGColor];
    self.locations = @[@0, @1];
    self.gradientDirectionType = SXGradientDirectionTypeVerticallyUpToDown;
}

#pragma mark - get
- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

#pragma mark - set
- (void)setPointStart:(CGPoint)pointStart {
    _pointStart = pointStart;
    self.gradientLayer.startPoint = _pointStart;
}

- (void)setPointEnd:(CGPoint)pointEnd {
    _pointEnd = pointEnd;
    self.gradientLayer.endPoint = _pointEnd;
}

- (void)setGradientDirectionType:(SXGradientDirectionType)gradientDirectionType {
    _gradientDirectionType = gradientDirectionType;
    
    switch (_gradientDirectionType) {
        case SXGradientDirectionTypeVerticallyUpToDown: {
            self.pointStart = CGPointZero;
            self.pointEnd = CGPointMake(0, 1);
        }
            break;
        case SXGradientDirectionTypeLeftUpToRightDown: {
            self.pointStart = CGPointZero;
            self.pointEnd = CGPointMake(1, 1);
        }
            break;
        case SXGradientDirectionTypeHorizontallyLeftToRight: {
            self.pointStart = CGPointZero;
            self.pointEnd = CGPointMake(1, 0);
        }
            break;
        case SXGradientDirectionTypeVerticallyDownToUp: {
            self.pointStart = CGPointMake(0, 1);
            self.pointEnd = CGPointZero;
        }
            break;
        case SXGradientDirectionTypeHorizontallyRightToLeft: {
            self.pointStart = CGPointMake(0, 1);
            self.pointEnd = CGPointZero;
        }
            break;
        case SXGradientDirectionTypeoRightDownToLeftUp: {
            self.pointStart = CGPointMake(1, 1);
            self.pointEnd = CGPointZero;
        }
            break;
        case SXGradientDirectionTypeLeftRightToUpDown: {
            self.pointStart = CGPointMake(1, 0);
            self.pointEnd = CGPointMake(0, 1);
        }
            break;
        default: {
            self.pointStart = CGPointZero;
            self.pointEnd = CGPointMake(0, 1);
        }
            break;
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.gradientLayer.frame = self.bounds;
}

- (void)setLocations:(NSArray<NSNumber *> *)locations {
    _locations = locations;
    self.gradientLayer.locations = _locations;
}

- (void)setColors:(NSArray *)colors {
    _colors = colors;
    self.gradientLayer.colors = _colors;
}

#pragma mark - response
- (void)drawViews {
    __weak typeof(self) weakSelf = self;
    [self transaction:^{
        __strong typeof(self) self = weakSelf;
        if (self) {
            [self.gradientLayer setNeedsDisplay];
        }
    } withAnimation:!self.disableAnimation];
}



@end

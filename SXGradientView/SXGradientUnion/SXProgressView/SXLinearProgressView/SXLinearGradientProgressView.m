//
//  SXLinearGradientProgressView.m
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import "SXLinearGradientProgressView.h"
#import "SXGradientHeader.h"


@interface SXLinearGradientProgressView ()

@property(nonatomic, strong) CAShapeLayer *shapeLayer;
@property(nonatomic, strong) CAGradientLayer *gradientLayer;

@end


@implementation SXLinearGradientProgressView

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
    
    self.backColor = UIColor.whiteColor;
    self.colors = @[(id)UIColor.redColor.CGColor, (id)UIColor.greenColor.CGColor];
    self.locations = @[@0, @1];
}

#pragma mark - get
- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = UIColor.clearColor.CGColor;
        _shapeLayer.strokeColor = UIColor.whiteColor.CGColor;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.lineJoin = kCALineJoinRound;
    }
    return _shapeLayer;
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 0);
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

#pragma mark - set
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self updateLayer];
}

- (void)setBackColor:(UIColor *)backColor {
    _backColor = backColor;
    self.backgroundColor = _backColor;
}

- (void)setLocations:(NSArray<NSNumber *> *)locations {
    _locations = locations;
    self.gradientLayer.locations = _locations;
}

- (void)setColors:(NSArray *)colors {
    _colors = colors;
    self.gradientLayer.colors = _colors;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    CGFloat percent = _progress/100.0;
    self.shapeLayer.strokeEnd = percent;
    [self drawViews];
}

#pragma mark - response
- (void)updateLayer {
    CGRect mRect = self.bounds;
    CGSize mSize = mRect.size;
    CGFloat centerY = mSize.height * 0.5;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, centerY)];
    [bezierPath addLineToPoint:CGPointMake(mSize.width, centerY)];
    
    self.shapeLayer.path = bezierPath.CGPath;
    self.shapeLayer.lineWidth = mSize.height;
    
    self.gradientLayer.frame = mRect;
    self.gradientLayer.mask = self.shapeLayer;
}

- (void)drawViews {
    __weak typeof(self) weakSelf = self;
    [self execute:^{
        __strong typeof(self) self = weakSelf;
        if (self) {
            [self.shapeLayer setNeedsDisplay];
        }
    } withAnimation:!self.disableAnimation];
}



@end

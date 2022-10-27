//
//  SXLinearProgressView.m
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import "SXLinearProgressView.h"
#import "SXGradientHeader.h"


@interface SXLinearProgressView ()

@property(nonatomic, strong) CAShapeLayer *shapeLayer;

@end


@implementation SXLinearProgressView

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
    
    self.backColor = UIColor.redColor;
    self.fillColor = UIColor.greenColor;
}

#pragma mark - get
- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = UIColor.clearColor.CGColor;
        _shapeLayer.strokeColor = UIColor.whiteColor.CGColor;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.lineJoin = kCALineJoinRound;
        [self.layer addSublayer:_shapeLayer];
    }
    return _shapeLayer;
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

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    self.shapeLayer.strokeColor = _fillColor.CGColor;
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

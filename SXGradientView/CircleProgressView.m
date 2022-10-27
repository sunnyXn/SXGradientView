//
//  CircleProgressView.m
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import "CircleProgressView.h"
#import "SXCircleProgressView.h"
#import "SXCircleGradientProgressView.h"
#import "SXGradientHeader.h"


@interface CircleProgressView ()

@property(nonatomic, strong) SXCircleProgressView *progressView;
@property(nonatomic, strong) SXCircleGradientProgressView *gradientProgressView;

@end


@implementation CircleProgressView

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
    
    [self addSubview:self.progressView];
    [self addSubview:self.gradientProgressView];
    
    CGFloat gap = 60 ;
    CGFloat width = 100;
    CGFloat left = (self.frame.size.width - width * 2.0 - gap) * 0.5;
    self.progressView.frame = CGRectMake(left, 0, width, 100);
    self.gradientProgressView.frame = CGRectMake(CGRectGetMaxX(self.progressView.frame) + gap, CGRectGetMinY(self.progressView.frame), CGRectGetWidth(self.progressView.frame), CGRectGetHeight(self.progressView.frame));
    
    
    CGFloat top = CGRectGetMaxY(self.gradientProgressView.frame) + 20;
    
    [self instanceSliderWithTop:top left:CGRectGetMinX(self.progressView.frame) action:@selector(progressChanged:)];
    [self instanceSliderWithTop:top left:CGRectGetMinX(self.gradientProgressView.frame) action:@selector(gradientProgressChanged:)];
    
    self.progressView.progress = 50;
    dispatch_async(dispatch_get_main_queue(), ^{
        // 隐式动画
        self.gradientProgressView.progress = self.progressView.progress;
    });
}

#pragma mark - get
- (SXCircleProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[SXCircleProgressView alloc] initWithFrame:CGRectMake(60, 0, 100, 100)];
        UIColor *fillColor = RGBColor(0xD54702);
        _progressView.backColor = [fillColor colorWithAlphaComponent:0.3];
        _progressView.fillColor = fillColor;
        [_progressView drawViews];
        _progressView.layer.masksToBounds = YES;
        _progressView.layer.cornerRadius = _progressView.bounds.size.height * 0.5;
    }
    return _progressView;
}

- (SXCircleGradientProgressView *)gradientProgressView {
    if (!_gradientProgressView) {
        _gradientProgressView = [[SXCircleGradientProgressView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.progressView.frame) + 50, CGRectGetMinY(self.progressView.frame), CGRectGetWidth(self.progressView.frame), CGRectGetHeight(self.progressView.frame))];
        _gradientProgressView.backColor = UIColor.cyanColor;
        _gradientProgressView.colors = @[(id)RGBColor(0xFF0000).CGColor , (id)RGBColor(0x00FF00).CGColor];
        [_gradientProgressView drawViews];
        _gradientProgressView.layer.masksToBounds = YES;
        _gradientProgressView.layer.cornerRadius = _gradientProgressView.bounds.size.height * 0.5;
    }
    return _gradientProgressView;
}

- (UISlider *)instanceSliderWithTop:(CGFloat)top left:(CGFloat)left action:(SEL)selector {
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(left, top, 100, 30)];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.minimumTrackTintColor = [UIColor greenColor];
    slider.maximumTrackTintColor = [UIColor redColor];
    [slider addTarget:self action:selector forControlEvents:UIControlEventValueChanged];
    [self addSubview:slider];
    return slider;
}

#pragma mark - set


#pragma mark - response
- (void)progressChanged:(UISlider *)slider {
    CGFloat progress = slider.value;
    self.progressView.progress = progress;
    NSLog(@"%s:%.2f", __func__,progress);
}

- (void)gradientProgressChanged:(UISlider *)slider {
    CGFloat progress = slider.value;
    self.gradientProgressView.progress = progress;
    NSLog(@"%s:%.2f", __func__,progress);
}


@end

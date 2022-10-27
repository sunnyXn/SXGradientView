//
//  ViewController.m
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#import "ViewController.h"
#import "SXGradientView.h"
#import "LinearProgressView.h"
#import "CircleProgressView.h"



@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSubViews];
}

#pragma mark - setupViews
- (void)addSubViews {
    [self addGradientView];
    [self addLinerProgressView];
    [self addCircleProgressView];
}

- (UILabel *)instanceLabelWithTop:(CGFloat)top font:(UIFont *)font text:(NSString *)text {
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:18];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, top, self.view.bounds.size.width, textFont.pointSize + 6)];
    titleLabel.font = textFont;
    titleLabel.textColor = UIColor.blackColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = text;
    [self.view addSubview:titleLabel];
    return titleLabel;
}

- (void)addGradientView {
    CGFloat gap = 60 ;
    CGFloat width = 100;
    CGFloat left = (self.view.frame.size.width - width * 2.0 - gap) * 0.5;
    
    UILabel *label = [self instanceLabelWithTop:60 font:nil text:@"渐变色"];
    CGFloat top = CGRectGetMaxY(label.frame) + 10;
    
    UILabel *label1 = [self instanceLabelWithTop:top font:[UIFont systemFontOfSize:15] text:@"左右渐变"];
    label1.frame = CGRectMake(left, top, width, 20);
    
    SXGradientView *gradientView = [[SXGradientView alloc] initWithFrame:CGRectMake(left, CGRectGetMaxY(label1.frame) + 5, width, width)];
    gradientView.colors = @[(id)RGBColor(0xFF00FF).CGColor , (id)RGBColor(0xFFF0F5).CGColor];
    gradientView.gradientDirectionType = SXGradientDirectionTypeHorizontallyLeftToRight;
    [gradientView drawViews];
    [self.view addSubview:gradientView];
    
    
    UILabel *label2 = [self instanceLabelWithTop:label1.frame.origin.y font:[UIFont systemFontOfSize:15] text:@"对角渐变"];
    label2.frame = CGRectMake(CGRectGetMaxX(gradientView.frame) + gap, label1.frame.origin.y, width, 20);
    SXGradientView *gradientView2 = [[SXGradientView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(gradientView.frame) + gap, CGRectGetMinY(gradientView.frame), CGRectGetWidth(gradientView.frame), CGRectGetHeight(gradientView.frame))];
    gradientView2.gradientDirectionType = SXGradientDirectionTypeLeftUpToRightDown;
    [gradientView2 drawViews];
    [self.view addSubview:gradientView2];
}

- (void)addLinerProgressView {
    UILabel *label = [self instanceLabelWithTop:260 font:nil text:@"线性进度条"];
    
    LinearProgressView *progressView = [[LinearProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame) + 20, self.view.frame.size.width, 100)];
    [self.view addSubview:progressView];
}

- (void)addCircleProgressView {
    UILabel *label = [self instanceLabelWithTop:400 font:nil text:@"圆环进度条"];
    
    CircleProgressView *progressView = [[CircleProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame) + 20, self.view.frame.size.width, 200)];
    [self.view addSubview:progressView];
}





@end

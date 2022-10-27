//
//  SXGradientHeader.h
//  SXGradientView
//
//  Created by Sunny on 2022/10/26.
//

#ifndef SXGradientHeader_h
#define SXGradientHeader_h


#import "UIView+Animation.h"

#define RGBColor(rgbColor)  UIColorFromRGB(rgbColor)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]






#endif /* SXGradientHeader_h */

//
//  VRoundRect.m
//  VRoundRectDemo
//
//  Created by Vols on 15/6/8.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VRoundView.h"

#define  kArrowHeight  8
#define  kArrowCurvature 5

#define  kInterval  5
#define  kMaxCurvature 24

#define kRGB(r, g, b)        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation VRoundView


- (void)setCurvature:(CGFloat)curvature{
    if (_curvature != curvature) {
        _curvature = curvature;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect{
    
    [self.borderColor set];     //设置线条颜色
    
    CGRect frame = CGRectMake(kInterval, kInterval + 10, self.bounds.size.width - kInterval*2, self.bounds.size.height - kInterval*2 - 10);
    
    float xMin = CGRectGetMinX(frame);
    float yMin = CGRectGetMinY(frame);
    float xMax = CGRectGetMaxX(frame);
    float yMax = CGRectGetMaxY(frame);
    
    //    CGPoint arrowPoint = [self convertPoint:self.showPoint fromView:_handerView];
    
    CGPoint arrowPoint = CGPointMake(50, 2);
    
    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
    
    [popoverPath moveToPoint:CGPointMake(xMin, yMin+kMaxCurvature*_curvature)];    //左上角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMin+kMaxCurvature*_curvature, yMin) controlPoint:CGPointMake(xMin, yMin)];
    
    
    /********************向上的箭头**********************/
    [popoverPath addLineToPoint:CGPointMake(arrowPoint.x - kArrowHeight, yMin)];//left side
    [popoverPath addCurveToPoint:arrowPoint
                   controlPoint1:CGPointMake(arrowPoint.x - kArrowHeight + kArrowCurvature, yMin)
                   controlPoint2:arrowPoint];//actual arrow point
    
    [popoverPath addCurveToPoint:CGPointMake(arrowPoint.x + kArrowHeight, yMin)
                   controlPoint1:arrowPoint
                   controlPoint2:CGPointMake(arrowPoint.x + kArrowHeight - kArrowCurvature, yMin)];//right side
    /**************************************************/
    
    [popoverPath addLineToPoint:CGPointMake(xMax-kMaxCurvature*_curvature, yMin)];//右上角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMax, yMin+kMaxCurvature*_curvature) controlPoint:CGPointMake(xMax, yMin)];

    [popoverPath addLineToPoint:CGPointMake(xMax, yMax-kMaxCurvature*_curvature)];   //右下角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMax - kMaxCurvature*_curvature, yMax) controlPoint:CGPointMake(xMax, yMax)];

    [popoverPath addLineToPoint:CGPointMake(xMin+kMaxCurvature*_curvature, yMax)];//左下角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMin, yMax - kMaxCurvature*_curvature) controlPoint:CGPointMake(xMin, yMax)];
    
    //填充颜色
    [kRGB(245, 245, 245) setFill];
    [popoverPath fill];
    
    [popoverPath closePath];
    [popoverPath stroke];
}


@end

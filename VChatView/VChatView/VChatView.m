//
//  VChatView.m
//  VChatView
//
//  Created by Vols on 15/8/21.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VChatView.h"

#define  kArrowWidth  8
#define  kArrowCurvature 5

#define  kInterval  5
#define  kMaxCurvature 24

#define kRGB(r, g, b)        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


@implementation VChatView

- (void)setCurvature:(CGFloat)curvature{
    if (_curvature != curvature) {
        _curvature = curvature;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect{
    
    [self.borderColor set];     //设置线条颜色
    
    CGRect frame = CGRectMake(kInterval+10, kInterval + 10, self.bounds.size.width - kInterval*2 - 10, self.bounds.size.height - kInterval*2 - 10);
    
    float xMin = CGRectGetMinX(frame);
    float yMin = CGRectGetMinY(frame);
    float xMax = CGRectGetMaxX(frame);
    float yMax = CGRectGetMaxY(frame);
    
    //    CGPoint arrowPoint = [self convertPoint:self.showPoint fromView:_handerView];
    
    CGPoint arrowPoint = CGPointMake(8, 50);
    
    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
    
    [popoverPath moveToPoint:CGPointMake(xMin, yMin+kMaxCurvature*_curvature)];    //左上角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMin+kMaxCurvature*_curvature, yMin) controlPoint:CGPointMake(xMin, yMin)];
    
    [popoverPath addLineToPoint:CGPointMake(xMax-kMaxCurvature*_curvature, yMin)];//右上角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMax, yMin+kMaxCurvature*_curvature) controlPoint:CGPointMake(xMax, yMin)];
    
    [popoverPath addLineToPoint:CGPointMake(xMax, yMax-kMaxCurvature*_curvature)];   //右下角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMax - kMaxCurvature*_curvature, yMax) controlPoint:CGPointMake(xMax, yMax)];
    
    [popoverPath addLineToPoint:CGPointMake(xMin+kMaxCurvature*_curvature, yMax)];//左下角
    [popoverPath addQuadCurveToPoint:CGPointMake(xMin, yMax - kMaxCurvature*_curvature) controlPoint:CGPointMake(xMin, yMax)];
    
    
    /********************向左的箭头**********************/
    [popoverPath addLineToPoint:CGPointMake(xMin, arrowPoint.y + kArrowWidth)];//left side
    [popoverPath addCurveToPoint:arrowPoint
                   controlPoint1:CGPointMake(xMin, arrowPoint.y + kArrowWidth - kArrowCurvature)
                   controlPoint2:arrowPoint];//actual arrow point
    
    [popoverPath addCurveToPoint:CGPointMake(xMin, arrowPoint.y - kArrowWidth)
                   controlPoint1:arrowPoint
                   controlPoint2:CGPointMake(xMin, arrowPoint.y - kArrowWidth + kArrowCurvature)];
    /**************************************************/
    
    //填充颜色
    [kRGB(245, 245, 245) setFill];
    [popoverPath fill];
    
    [popoverPath closePath];
    [popoverPath stroke];
}



@end

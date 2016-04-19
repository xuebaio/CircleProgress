//
//  CircleView.m
//  CircleProgress
//
//  Created by 学霸 on 16/4/19.
//  Copyright © 2016年 学霸. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView



- (void)drawRect:(CGRect)rect {
    NSString *text = [NSString stringWithFormat:@"%.2f",self.progress];
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;
    CGFloat textW = 20;
    CGFloat textH = 20;
    CGFloat textX = (viewW - textW) * 0.5;
    CGFloat textY = (viewH - textH) * 0.5;
    [text drawInRect:CGRectMake(textX, textY, textW, textH) withAttributes:nil];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat radius = viewW * 0.4;
    CGFloat endAngle = self.progress * 2 * M_PI - M_PI_2 * 0.3;
    CGContextAddArc(context, viewW * 0.5, viewH * 0.5, radius, - M_PI_2 * 0.3, endAngle, 0);
    CGContextStrokePath(context);
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}
@end

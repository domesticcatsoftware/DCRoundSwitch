//
//  TestSwitchKnobLayer.m
//  DCRoundSwitchDemo
//
//  Created by Pete Callaway on 30/05/2012.
//

#import "TestSwitchKnobLayer.h"


@implementation TestSwitchKnobLayer

- (void)drawInContext:(CGContextRef)context {
	CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectInset(self.bounds, 2, 2));
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0, NULL);
}

@end

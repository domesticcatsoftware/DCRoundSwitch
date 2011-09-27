//
//  DCRoundSwitchKnobLayer.m
//
//  Created by Patrick Richards on 29/06/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import "DCRoundSwitchKnobLayer.h"

CGGradientRef GradientRefWithColors(CGColorSpaceRef colorSpace, CGColorRef startColor, CGColorRef endColor);

@implementation DCRoundSwitchKnobLayer
@synthesize gripped;

- (void)drawInContext:(CGContextRef)context
{
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	CGRect knobRect = CGRectInset(self.bounds, 2, 2);
	CGFloat knobRadius = self.bounds.size.height - 2;

	// knob outline (shadow is drawn in the toggle layer)
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.62 alpha:1.0].CGColor);
	CGContextSetLineWidth(context, 1.5);
	CGContextStrokeEllipseInRect(context, knobRect);
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0, NULL);

	// knob inner gradient
	CGContextAddEllipseInRect(context, knobRect);
	CGContextClip(context);
	CGColorRef knobStartColor = [UIColor colorWithWhite:0.82 alpha:1.0].CGColor;
	CGColorRef knobEndColor = (self.gripped) ? [UIColor colorWithWhite:0.894 alpha:1.0].CGColor : [UIColor colorWithWhite:0.996 alpha:1.0].CGColor;
	CGPoint topPoint = CGPointMake(0, 0);
	CGPoint bottomPoint = CGPointMake(0, knobRadius + 2);
	CGGradientRef knobGradient = GradientRefWithColors(colorSpace, knobStartColor, knobEndColor);
	CGContextDrawLinearGradient(context, knobGradient, topPoint, bottomPoint, 0);

	// knob inner highlight
	CGContextAddEllipseInRect(context, CGRectInset(knobRect, 0.5, 0.5));
	CGContextAddEllipseInRect(context, CGRectInset(knobRect, 1.5, 1.5));
	CGContextEOClip(context);
	CGGradientRef knobHighlightGradient = GradientRefWithColors(colorSpace, [UIColor whiteColor].CGColor, [UIColor colorWithWhite:1.0 alpha:0.5].CGColor);
	CGContextDrawLinearGradient(context, knobHighlightGradient, topPoint, bottomPoint, 0);

	CGColorSpaceRelease(colorSpace);
}

CGGradientRef GradientRefWithColors(CGColorSpaceRef colorSpace, CGColorRef startColor, CGColorRef endColor)
{
	CGFloat colorStops[2] = {0.0, 1.0};
	CGColorRef colors[] = {startColor, endColor};
	CFArrayRef colorsArray = CFArrayCreate(NULL, (const void**)colors, sizeof(colors) / sizeof(CGColorRef), &kCFTypeArrayCallBacks);
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, colorsArray, colorStops);
	[NSMakeCollectable(gradient) autorelease];
	CFRelease(colorsArray);
	return gradient;
}

- (void)setGripped:(BOOL)newGripped
{
	gripped = newGripped;
	[self setNeedsDisplay];
}

@end

//
//  DCRoundSwitchToggleLayer.m
//
//  Created by Patrick Richards on 29/06/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import "DCRoundSwitchToggleLayer.h"

@implementation DCRoundSwitchToggleLayer
@synthesize onString, offString, onImage, offImage, onTintColor;
@synthesize drawOnTint;
@synthesize clip;
@synthesize labelFont;

- (void)dealloc
{
	[onString release];
	[offString release];
	[onTintColor release];
	[onImage release];
	[offImage release];

	[super dealloc];
}

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor
{
	if ((self = [super init]))
	{
		self.onString = anOnString;
		self.offString = anOffString;
		self.onTintColor = anOnTintColor;
        self.onImage = nil;
        self.offImage = nil;
	}

	return self;
}

- (id)initWithOnImage:(UIImage *)anOnImage offImage:(UIImage *)anOffImage onTintColor:(UIColor *)anOnTintColor
{
    if ((self = [super init]))
    {
        self.onImage = anOnImage;
        self.offImage = anOffImage;
        self.onTintColor = anOnTintColor;
    }
    
    return self;
}

- (UIFont *)labelFont
{
	return [UIFont boldSystemFontOfSize:ceilf(self.bounds.size.height * .6)];
}

- (void)drawInContext:(CGContextRef)context
{
	CGFloat knobRadius = self.bounds.size.height - 2.0;
	CGFloat knobCenter = self.bounds.size.width / 2.0;
	CGRect knobRect = CGRectMake(knobCenter - knobRadius / 2.0, 1.0, knobRadius, knobRadius);

	if (self.clip)
	{
		UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-self.frame.origin.x + 0.5, 0, self.bounds.size.width / 2.0 + self.bounds.size.height / 2.0 - 1.5, self.bounds.size.height) cornerRadius:self.bounds.size.height / 2.0];
		CGContextAddPath(context, bezierPath.CGPath);
		CGContextClip(context);
	}

	// on tint color
	if (self.drawOnTint)
	{
		CGContextSetFillColorWithColor(context, self.onTintColor.CGColor);
		CGContextFillRect(context, CGRectMake(0, 0, knobCenter, self.bounds.size.height));
	}

	// off tint color (white)
	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.963 alpha:1.0].CGColor);
	CGContextFillRect(context, CGRectMake(knobCenter, 0, self.bounds.size.width - knobCenter, self.bounds.size.height));

	// knob shadow
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 1.5, [UIColor colorWithWhite:0.2 alpha:1.0].CGColor);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.42 alpha:1.0].CGColor);
	CGContextSetLineWidth(context, 1.0);
	CGContextStrokeEllipseInRect(context, knobRect);
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0, NULL);
	

	// strings
	CGFloat textSpaceWidth = (self.bounds.size.width / 2) - (knobRadius / 2);

	UIGraphicsPushContext(context);
//withOffset:drawPercent * (boundsRect.size.width - knobWidth)
//inTrackWidth:(boundsRect.size.width - knobWidth)];

    if (self.onImage) {
        CGPoint onImagePoint = CGPointMake((textSpaceWidth - self.onImage.size.width) / 2.0 + knobRadius * .15, floorf((self.bounds.size.height - self.onImage.size.height) / 2.0) + 1.0);
        [self.onImage drawAtPoint:onImagePoint];
    } else {
        // 'ON' state label (self.onString)
        CGSize onTextSize = [self.onString sizeWithFont:self.labelFont];
        CGPoint onTextPoint = CGPointMake((textSpaceWidth - onTextSize.width) / 2.0 + knobRadius * .15, floorf((self.bounds.size.height - onTextSize.height) / 2.0) + 1.0);
        [[UIColor colorWithWhite:0.45 alpha:1.0] set]; // .2 & .4
        [self.onString drawAtPoint:CGPointMake(onTextPoint.x, onTextPoint.y - 1.0) withFont:self.labelFont];
        [[UIColor whiteColor] set];
        [self.onString drawAtPoint:onTextPoint withFont:self.labelFont];
    }

    if (self.offImage) {
        CGPoint offImagePoint = CGPointMake(textSpaceWidth + (textSpaceWidth - self.onImage.size.width) / 2.0 + knobRadius * .86, floorf((self.bounds.size.height - self.onImage.size.height) / 2.0) + 1.0);			
        [offImage drawAtPoint:offImagePoint];			
    } else {
        // 'OFF' state label (self.offString)
        CGSize offTextSize = [self.offString sizeWithFont:self.labelFont];
        CGPoint offTextPoint = CGPointMake(textSpaceWidth + (textSpaceWidth - offTextSize.width) / 2.0 + knobRadius * .86, floorf((self.bounds.size.height - offTextSize.height) / 2.0) + 1.0);
        [[UIColor whiteColor] set];
        [self.offString drawAtPoint:CGPointMake(offTextPoint.x, offTextPoint.y + 1.0) withFont:self.labelFont];
        [[UIColor colorWithWhite:0.52 alpha:1.0] set];
        [self.offString drawAtPoint:offTextPoint withFont:self.labelFont];
    }
    
	UIGraphicsPopContext();
}

@end

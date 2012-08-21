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
//  Modified by Jose Luis Campaña to add text and offTint color support

#import "DCRoundSwitchToggleLayer.h"

@implementation DCRoundSwitchToggleLayer
@synthesize onString, offString, onTintColor;
@synthesize drawOnTint;
@synthesize clip;
@synthesize labelFont;

//iZ3 Additions
@synthesize onTextColor = _onTextColor;
@synthesize offTextColor = _offTextColor;
@synthesize onTextShadowColor = _onTextShadowColor;
@synthesize offTextShadowColor = _offTextShadowColor;
@synthesize offTintColor = _offTintColor;

-(void)iniController
{
    //iZ3 Additions
    _onTextColor = [[UIColor colorWithWhite:0.45 alpha:1.0] retain];
    _offTextColor = [[UIColor whiteColor] retain];
    _onTextShadowColor = [[UIColor whiteColor] retain];
    _offTextShadowColor = [[UIColor colorWithWhite:0.52 alpha:1.0] retain];
    _offTintColor = [[UIColor colorWithWhite:0.963 alpha:1.0] retain];
}


- (void)dealloc
{
	[onString release];
	[offString release];
	[onTintColor release];
    
    //iZ3
    [_offTextShadowColor release];
    [_offTextColor release];
    [_onTextColor release];
    [_onTextShadowColor release];
    [_offTintColor release];


	[super dealloc];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self iniController];
    }
    return self;
}

-(id)init
{
    if ((self = [super init]))
	{
        [self iniController];
    }
    return self;
}

-(id) initWithLayer:(id)layer
{
    if(self = [super initWithLayer:layer])
    {
        [self iniController];
    }
    return self;
}

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor
{
	if ((self = [super init]))
	{
		self.onString = anOnString;
		self.offString = anOffString;
		self.onTintColor = anOnTintColor;
        
        [self iniController];
        
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
//	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.963 alpha:1.0].CGColor);
    CGContextSetFillColorWithColor(context, _offTintColor.CGColor);
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

	// 'ON' state label (self.onString)
	CGSize onTextSize = [self.onString sizeWithFont:self.labelFont];
	CGPoint onTextPoint = CGPointMake((textSpaceWidth - onTextSize.width) / 2.0 + knobRadius * .15, floorf((self.bounds.size.height - onTextSize.height) / 2.0) + 1.0);
	[_onTextShadowColor set];
    [self.onString drawAtPoint:CGPointMake(onTextPoint.x, onTextPoint.y - 1.0) withFont:self.labelFont];
    [_onTextColor set];
	[self.onString drawAtPoint:onTextPoint withFont:self.labelFont];

	// 'OFF' state label (self.offString)
	CGSize offTextSize = [self.offString sizeWithFont:self.labelFont];
	CGPoint offTextPoint = CGPointMake(textSpaceWidth + (textSpaceWidth - offTextSize.width) / 2.0 + knobRadius * .86, floorf((self.bounds.size.height - offTextSize.height) / 2.0) + 1.0);
	[_offTextShadowColor set];
    [self.offString drawAtPoint:CGPointMake(offTextPoint.x, offTextPoint.y + 1.0) withFont:self.labelFont];
    [_offTextColor set];
	[self.offString drawAtPoint:offTextPoint withFont:self.labelFont];

	UIGraphicsPopContext();
}

@end

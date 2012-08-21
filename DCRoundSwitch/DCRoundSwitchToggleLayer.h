//
//  DCRoundSwitchToggleLayer.h
//
//  Created by Patrick Richards on 29/06/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//
//  Modified by Jose Luis Campaña to add text and offTint color support

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface DCRoundSwitchToggleLayer : CALayer

@property (nonatomic, retain) UIColor *onTintColor;
@property (nonatomic, retain) NSString *onString;
@property (nonatomic, retain) NSString *offString;
@property (nonatomic, readonly) UIFont *labelFont;
@property (nonatomic) BOOL drawOnTint;
@property (nonatomic) BOOL clip;

//iZ3 Additions
@property (nonatomic, retain) UIColor *onTextColor;
@property (nonatomic, retain) UIColor *offTextColor;
@property (nonatomic, retain) UIColor *onTextShadowColor;
@property (nonatomic, retain) UIColor *offTextShadowColor;
@property (nonatomic, retain) UIColor *offTintColor;

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor;

@end

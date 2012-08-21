//
//  DCRoundSwitch.h
//
//  Created by Patrick Richards on 28/06/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//
//  Modified by Jose Luis Campaña to add text and offTint color support

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class DCRoundSwitchToggleLayer;
@class DCRoundSwitchOutlineLayer;
@class DCRoundSwitchKnobLayer;

@interface DCRoundSwitch : UIControl

@property (nonatomic, retain) UIColor *onTintColor;		// default: blue (matches normal UISwitch)
@property (nonatomic, getter=isOn) BOOL on;				// default: NO
@property (nonatomic, copy) NSString *onText;			// default: 'ON' - automatically localized
@property (nonatomic, copy) NSString *offText;			// default: 'OFF' - automatically localized

//iZ3 Additions
@property (nonatomic, retain) UIColor *onTextColor;
@property (nonatomic, retain) UIColor *offTextColor;
@property (nonatomic, retain) UIColor *onTextShadowColor;
@property (nonatomic, retain) UIColor *offTextShadowColor;
@property (nonatomic, retain) UIColor *offTintColor;

+ (Class)knobLayerClass;
+ (Class)outlineLayerClass;
+ (Class)toggleLayerClass;

- (void)setOn:(BOOL)newOn animated:(BOOL)animated;
- (void)setOn:(BOOL)newOn animated:(BOOL)animated ignoreControlEvents:(BOOL)ignoreControlEvents;

@end

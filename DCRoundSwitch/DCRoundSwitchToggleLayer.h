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

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface DCRoundSwitchToggleLayer : CALayer

@property (nonatomic, retain) UIColor *onTintColor;
@property (nonatomic, retain) NSString *onString;
@property (nonatomic, retain) NSString *offString;
@property (nonatomic, retain) UIImage *onImage;
@property (nonatomic, retain) UIImage *offImage;
@property (nonatomic, readonly) UIFont *labelFont;
@property (nonatomic) BOOL drawOnTint;
@property (nonatomic) BOOL clip;

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor;
- (id)initWithOnImage:(UIImage *)anOnImage offImage:(UIImage *)anOffImage onTintColor:(UIColor *)anOnTintColor;

@end

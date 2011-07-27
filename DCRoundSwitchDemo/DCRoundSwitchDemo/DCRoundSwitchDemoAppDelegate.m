//
//  DCRoundSwitchDemoAppDelegate.m
//  DCRoundSwitchDemo
//
//  Created by Patrick Richards on 6/07/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import "DCRoundSwitchDemoAppDelegate.h"
#import "DCRoundSwitchDemoViewController.h"
#import "DCIntrospect.h"

@implementation DCRoundSwitchDemoAppDelegate
@synthesize window, viewController;

- (void)dealloc
{
	[window release];
	[viewController release];
	
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef DEBUG
	[[DCIntrospect sharedIntrospector] start];
#endif

	self.window.rootViewController = self.viewController;
	[self.window makeKeyAndVisible];
	return YES;
}

@end

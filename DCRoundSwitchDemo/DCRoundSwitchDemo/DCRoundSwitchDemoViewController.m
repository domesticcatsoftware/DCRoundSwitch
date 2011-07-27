//
//  DCRoundSwitchDemoViewController.m
//
//  Created by Patrick Richards on 6/07/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import "DCRoundSwitchDemoViewController.h"

@implementation DCRoundSwitchDemoViewController
@synthesize fatSwitch;
@synthesize switch1;
@synthesize switch2;
@synthesize switch3;
@synthesize longSwitch;

- (void)dealloc
{
    [longSwitch release];
    [fatSwitch release];
	[switch1 release];
	[switch2 release];
	[switch3 release];

	[super dealloc];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.switch1.on = YES;
	[self.switch1 addTarget:self action:@selector(switch1Toggled:) forControlEvents:UIControlEventValueChanged];

	self.switch2.onTintColor = [UIColor redColor];
	self.switch2.on = YES;

	self.switch3.onTintColor = [UIColor blackColor];
	self.switch3.on = YES;
	[self.switch3 addTarget:self action:@selector(switch3Toggled:) forControlEvents:UIControlEventValueChanged];

	self.fatSwitch.onText = @"1";
	self.fatSwitch.offText = @"0";

	self.longSwitch.onText = @"CUSTOM TEXT ON";
	self.longSwitch.offText = @"CUSTOM TEXT OFF";
	self.longSwitch.on = YES;
}

- (void)viewDidUnload
{
	[self setLongSwitch:nil];
	[self setFatSwitch:nil];
	[self setSwitch1:nil];
	[self setSwitch2:nil];
	[self setSwitch3:nil];

	[super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)switch1Toggled:(id)sender
{
	[switch2 setOn:!switch2.isOn animated:YES];
}

- (void)switch3Toggled:(id)sender
{
	[fatSwitch setOn:!fatSwitch.isOn animated:YES];
}

@end

//
//  DCRoundSwitchDemoViewController.h
//
//  Created by Patrick Richards on 6/07/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import <UIKit/UIKit.h>
#import "DCRoundSwitch.h"

@interface DCRoundSwitchDemoViewController : UIViewController
{
}

@property (nonatomic, retain) IBOutlet DCRoundSwitch *switch1;
@property (nonatomic, retain) IBOutlet DCRoundSwitch *switch2;
@property (nonatomic, retain) IBOutlet DCRoundSwitch *switch3;

@property (nonatomic, retain) IBOutlet DCRoundSwitch *longSwitch;
@property (nonatomic, retain) IBOutlet DCRoundSwitch *fatSwitch;

@end

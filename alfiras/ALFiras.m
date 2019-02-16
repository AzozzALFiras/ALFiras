// Developer : Azozz ALFiras
// Source Code : github.com/AzozzALFiras/ALFiras
// Thanks for help : Elias Sfeir
// Twitter : @eliassfeir1
// Download Video & Photo from story & message
// snapchat



#import "Headers/PSListController.h"
#import "Headers/PSSpecifier.h"
#import "Headers/PSTableCell.h"
#import "Headers/PSViewController.h"
#import <Social/SLComposeViewController.h>
#import <Social/SLServiceTypes.h>
#include <spawn.h>
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)



@interface PSControlTableCell : PSTableCell
- (UIControl *)control;
@end
@interface PSSwitchTableCell : PSControlTableCell
- (id)initWithStyle:(int)style reuseIdentifier:(id)identifier specifier:(id)specifier;
@end

@interface myTableCell : PSSwitchTableCell
@end

@implementation myTableCell

-(id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2 specifier:(id)arg3 {
 self = [super initWithStyle:arg1 reuseIdentifier:arg2 specifier:arg3];

if (self) {

  [((UISwitch *)[self control]) setOnTintColor:[UIColor redColor]];

}

return self;
}

@end

@interface ALFirasListController: PSListController {
}
@end




@implementation ALFirasListController


- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ALFiras" target:self] retain];
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"ALFiras"
                           message:@"Welcome to ALFiras ❤️ "
                           preferredStyle:UIAlertControllerStyleAlert];

UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@" ❤️ " style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {}];

[alert addAction:defaultAction];
[self presentViewController:alert animated:YES completion:nil];
    }


	}
UIBarButtonItem *shareButton = ([[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(share:)]);
        shareButton.tag = 1;
        [[self navigationItem] setRightBarButtonItem:shareButton];

	[UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = [UIColor blueColor];
	return _specifiers;

}
-(void)share:(id)arg1{
SLComposeViewController * composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [composeController setInitialText:@"I'm using #ALFiras by @azzozalfiras to enhance snapchat"];
        [self presentViewController:composeController animated:YES completion:nil];
        }

-(void)paypal{
if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")) {
   UIApplication *application = [UIApplication sharedApplication];
[application openURL:[NSURL URLWithString:@"https://paypal.me/Azozz"] options:@{} completionHandler:nil];
}else{
       UIApplication *mySafari = [UIApplication sharedApplication];
    NSURL *myURL = [[NSURL alloc]initWithString:@"https://paypal.me/Azozz"];
    [mySafari openURL:myURL];

}
}
-(void)instagram{
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")) {
   UIApplication *application = [UIApplication sharedApplication];
[application openURL:[NSURL URLWithString:@"https://instagram.com/_fkn"] options:@{} completionHandler:nil];
}else{
       UIApplication *mySafari = [UIApplication sharedApplication];
    NSURL *myURL = [[NSURL alloc]initWithString:@"https://instagram.com/_fkn"];
    [mySafari openURL:myURL];

}
}
-(void)snapchat{
  if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")) {
   UIApplication *application = [UIApplication sharedApplication];
[application openURL:[NSURL URLWithString:@"https://snapchat.com/add/n.uf"] options:@{} completionHandler:nil];
}else{
       UIApplication *mySafari = [UIApplication sharedApplication];
    NSURL *myURL = [[NSURL alloc]initWithString:@"https://snapchat.com/add/n.uf"];
    [mySafari openURL:myURL];

}

}
-(void)cydia{
if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")) {
   UIApplication *application = [UIApplication sharedApplication];
[application openURL:[NSURL URLWithString:@"https://a1iraqi.me/"] options:@{} completionHandler:nil];
}else{
       UIApplication *mySafari = [UIApplication sharedApplication];
    NSURL *myURL = [[NSURL alloc]initWithString:@"https://a1iraqi.me/"];
    [mySafari openURL:myURL];

}
}
-(void)tweet{
UIApplication *application = [UIApplication sharedApplication];
[application openURL:[NSURL URLWithString:@"twitter:///user?screen_name=AzozzAlFiras"] options:@{} completionHandler:nil];


}
@end

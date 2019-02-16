// Developer : Azozz ALFiras
// Source Code : github.com/AzozzALFiras/ALFiras
// Thanks for help : Elias Sfeir
// Twitter : @eliassfeir1
// Download Video & Photo from story & message
// snapchat


#import <UIKit/UIKit.h>
#import <Social/SLComposeViewController.h>
#import <Social/SLServiceTypes.h>
#import "UIAlert+Blocks.h"
#import <QuartzCore/QuartzCore.h>
#import <Cephei/HBPreferences.h>
#import <AVFoundation/AVFoundation.h>

extern NSString *const HBPreferencesDidChangeNotification;

HBPreferences *preferences;




static BOOL enable;
%ctor
{

  // Name Header tweak
  preferences = [[HBPreferences alloc] initWithIdentifier:@"com.i1iraqi.ALFiras"];

     [preferences registerBool:&enable default:NO forKey:@"enable"];
}

@interface SCOperaPageViewController : UIViewController
-(id)shareableMedia;
-(void)loadView;
-(NSArray*)shareableMedias;
-(void)viewDidAppear:(BOOL)arg1;
-(void)stop;
-(id)configuration;
@end

@interface SCOperaConfiguration
-(id)remoteVideoPropertiesProvider;
@end

@interface SCDiscoverVideoCatalogService
-(NSMutableDictionary *)videoCatalogMap;
@end


@interface SCDiscoverVideoCatalog
-(id)videoURLs;
@end



@interface SCOperaShareableMedia : SCOperaPageViewController
{
  UIImage *_image;
}
@property NSInteger mediaType;
-(id)image;
-(id)videoURL;
-(id)videoAsset;
@end


@interface SettingsViewController : UIViewController
{
	UITableView *_tableView;
}
-(void)didBecomeActive;
-(void)reloadTableOnMainThread;
-(void)loadView;
@end

@interface SCOperaViewController
-(id)shareableMedias;
@end


UIButton *button1;

%hook SCOperaPageViewController
-(void)autoAdvanceTimerDidFire{

}
-(void)viewDidAppear:(BOOL)arg1{
    %orig;
if(enable){
   double screenHeight = [[UIScreen mainScreen] bounds].size.height;

// button Tweak

 button1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
[button1 addTarget:self
           action:@selector(didPressSave:)
 forControlEvents:UIControlEventTouchUpInside];
[button1 setTitle:@"" forState:UIControlStateNormal];

// iPhone 5/5S/SE
 if (screenHeight == 568) {
        NSLog(@"iPhone 5/5S/SE");
         button1.center = CGPointMake(300 , 500);
}else if (screenHeight == 667) {

// iPhone 6/7
        button1.center = CGPointMake(350 , 635);
    } else if(screenHeight == 736){

// iPhone 8 and Up
       button1.center = CGPointMake(370 ,700);
    }else{
      button1.center = CGPointMake(320 ,665);
    }

[self.view addSubview:button1];

}else{
  %orig;
}
}
%new
-(void)didPressSave:(UIButton*)button{

[self stop];
NSArray* test = [self shareableMedias];

if(test.count == 1){
id test1 = [test firstObject];

UIImage *test2 = [test1 image];

NSString * message = @"Check this Photo !";


NSArray * shareItems = @[message, test2];

UIActivityViewController * avc = [[ UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];

[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:avc animated:YES completion:NULL];
[avc setCompletionWithItemsHandler:^(NSString *activityType,BOOL completed, NSArray *returnedItems, NSError *activityError){

}];
}else if(test.count >= 2){

	id video = [test objectAtIndex:1];

  id asset = [video videoAsset];

  NSURL *videoURL = [asset URL];
if(videoURL){

 NSArray * shareItems = @[videoURL];

UIActivityViewController * avc = [[ UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];

[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:avc animated:YES completion:NULL];
[avc setCompletionWithItemsHandler:^(NSString *activityType,BOOL completed, NSArray *returnedItems, NSError *activityError){

}];

}else{


id stockVideo = [test objectAtIndex:1];
NSURL *stockVideoURL = [stockVideo videoURL];


  NSArray * shareItems = @[stockVideoURL];

UIActivityViewController * avc = [[ UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];

[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:avc animated:YES completion:NULL];
[avc setCompletionWithItemsHandler:^(NSString *activityType,BOOL completed, NSArray *returnedItems, NSError *activityError){

}];


}
}

}
%end

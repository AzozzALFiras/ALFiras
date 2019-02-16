// Developer : Azozz ALFiras
// Source Code : github.com/AzozzALFiras/ALFiras
// Thanks for help : Elias Sfeir
// Twitter : @eliassfeir1
// Download Video & Photo from story & message
// snapchat



#import <UIKit/UIKit.h>

@interface UIAlertView (Blocks)

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion;

@end

// Developer : Azozz ALFiras
// Source Code : github.com/AzozzALFiras/ALFiras
// Thanks for help : Elias Sfeir
// Twitter : @eliassfeir1
// Download Video & Photo from story & message
// snapchat


#import <objc/runtime.h>

@interface INAlertWrapper : NSObject

@property (copy) void(^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation INAlertWrapper

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock) {
        self.completionBlock(alertView, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (self.completionBlock) {
        self.completionBlock(alertView, alertView.cancelButtonIndex);
    }
}

@end


static const char kINAlertWrapper;

@implementation UIAlertView (Blocks)

- (void)showWithCompletion:(void (^)(UIAlertView *, NSInteger))completion
{
    INAlertWrapper *wrapper = [INAlertWrapper new];
    wrapper.completionBlock = completion;
    self.delegate = wrapper;

    objc_setAssociatedObject(self, &kINAlertWrapper, wrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [self show];
}
@end

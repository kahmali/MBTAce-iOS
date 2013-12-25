#import "ModalAlertDisplayer.h"

@implementation ModalAlertDisplayer

+ (void)displayModalAlert:(NSString *)message {
    
    //Create an alert dialog
    UIAlertView *notImplementedAlert = [[UIAlertView alloc]
                                        initWithTitle:@"alert!" message:message delegate:nil
                                        cancelButtonTitle:@"ok" otherButtonTitles:nil];
    //Show it
    [notImplementedAlert show];
}

@end

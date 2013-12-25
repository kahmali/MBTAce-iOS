#import <Foundation/Foundation.h>

//For displaying modal alert dialogs with a dismiss button
@interface ModalAlertDisplayer : NSObject

//Displays a modal box with a message
+ (void)displayModalAlert:(NSString *) message;

@end

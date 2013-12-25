#import <Foundation/Foundation.h>
#import "WebServiceDispatcher.h"
#import "Logging.h"

//Constants for web service methods
extern NSString *const METHOD_POST;
extern NSString *const METHOD_GET;

//Constants for web request error codes
//Indicates that the internet connect appears to be offline
extern const int WS_CODE_OFFLINE;

/*
 * Provides a general way to make asynchronous web calls
 */
@interface WebServiceDispatcher : NSObject

//Make an async web call then execute the supplied block
+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *) method
                thenExecute:(void (^)(NSURLResponse*, NSData*, NSError*))block;

//Make an async web call, notifying supplied delegate as events occur
+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *) method
              usingDelegate:(id)delegate;

//Make an async web call with a request body then execute the supplied block
+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *) method withBody:(NSString *) body
                thenExecute:(void (^)(NSURLResponse*, NSData*, NSError*))block;

//Make an async web call with a request body, notifying supplied delegate as events occur
+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *)method withBody:(NSString *) body
              usingDelegate:(id)delegate;

@end

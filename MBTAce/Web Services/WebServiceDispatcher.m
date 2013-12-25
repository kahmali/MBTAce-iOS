#import <Foundation/Foundation.h>
#import "WebServiceDispatcher.h"
#import "Logging.h"

NSString *const METHOD_POST = @"POST";
NSString *const METHOD_GET = @"GET";

const int WS_CODE_OFFLINE = -1009;

@implementation WebServiceDispatcher : NSObject

+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *) method
                thenExecute:(void (^)(NSURLResponse*, NSData*, NSError*))block {

    //Make web call with empty body
    [self makeWebCallWithURL:URL usingMethod:method withBody:@"" thenExecute:block];
    
}

+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *) method
              usingDelegate:(id)delegate {
    
}

+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *) method withBody:(NSString *) body
                thenExecute:(void (^)(NSURLResponse*, NSData*, NSError*))block {
    
    //Create request object
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL]];
    
    //Ensure a valid HTTP method was chosen
    if(![method isEqualToString:METHOD_POST] && ![method isEqualToString:METHOD_GET]) {
        LogError(@"Invalid HTTP method: %@", method);
        return;
    }
    
    //Set the method of the request
    [request setHTTPMethod:method];
    
    //Set the body of the request
    [request setHTTPBody:[NSData dataWithBytes:[body UTF8String] length:strlen([body UTF8String])]];
    
    //Send the request asynchronously on main thread and execute block
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:block];
}

+ (void) makeWebCallWithURL:(NSString *)URL usingMethod:(NSString *)method withBody:(NSString *)body
              usingDelegate:(id)delegate {
}

@end

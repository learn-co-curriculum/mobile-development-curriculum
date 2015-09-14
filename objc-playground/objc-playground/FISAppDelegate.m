//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISWarship.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    
    
    for (NSUInteger i = 1; i <= 100; i++) {
        NSString *result = @"";
        if (i % 3 == 0) {
            result = @"Fizz";
        }
        if (i % 5 == 0) {
            result = [result stringByAppendingString:@"Buzz"];
        }
        if (result.length == 0) {
            result = [NSString stringWithFormat:@"%lu", i];
        }
        NSLog(@"%@", result);
    }
    
    
    
//    for (NSUInteger i = 1; i <= 100; i++) {
//        NSString *result = @"";
//        result = i % 3 == 0 ? @"Fizz" : result;
//        result = i % 5 == 0 ? [result stringByAppendingString:@"Buzz"] : result;
//        result = result.length > 0 ? result : [NSString stringWithFormat:@"%lu", i];
//        NSLog(@"%@", result);
//    }
    
    return YES;
}

@end



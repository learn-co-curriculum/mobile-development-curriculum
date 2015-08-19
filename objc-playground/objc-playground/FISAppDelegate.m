//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISRadio.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISRadio *radio = [[FISRadio alloc] init];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
    [radio increaseFrequencies];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
    [radio decreaseFrequencies];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
    [radio decreaseFrequencies];
    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
          
    return YES;
}

@end

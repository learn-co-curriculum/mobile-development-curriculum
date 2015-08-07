//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISRadio.h"

@interface FISAppDelegate ()

@end

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISRadio *radio = [[FISRadio alloc] init];
    
    NSLog(@"%d", radio.stereo);
    
    [radio toggleStereo];
    
    NSLog(@"%d", radio.stereo);
    
    return YES;
}

@end

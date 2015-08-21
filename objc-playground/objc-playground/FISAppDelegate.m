//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISWarship.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    FISRadio *radio = [[FISRadio alloc] init];
//    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
//    [radio increaseFrequencies];
//    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
//    [radio decreaseFrequencies];
//    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
//    [radio decreaseFrequencies];
//    NSLog(@"AM: %.1f, FM: %.1f", radio.amFrequency, radio.fmFrequency);
    
    FISWarship *ussMissouri = [[FISWarship alloc] initWithShipName:@"USS Missouri"
                                               currentSpeedInKnots:0
                                               maximumSpeedInKnots:33];
    
    NSLog(@"Ship's Name: %@", ussMissouri.shipName);
    NSLog(@"Current Speed: %lu", ussMissouri.currentSpeedInKnots);
    NSLog(@"Maximum Speed: %lu", ussMissouri.maximumSpeedInKnots);
    
    [ussMissouri aheadOneHalfSpeed];
    [ussMissouri fullStop];
    [ussMissouri fullSpeedAhead];
    
//    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
//                                                                    ascending:YES];
    
    NSSortDescriptor *sortByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                                  ascending:YES];
    
    
//    sortByNameAsc.key = @"name";
//    sortByNameAsc.ascending = YES;
    
//    NSArray *instructors = [[NSArray alloc] initWithObjects:@"Joe", @"Tim", @"Tom", @"Jim", @"Mark", nil];
    
    NSMutableArray *instructors = [[NSMutableArray alloc] init];
    [instructors addObjectsFromArray:@[@"Joe", @"Tim", @"Tom", @"Jim", @"Mark"]];

    NSLog(@"%@", instructors);
    
    return YES;
}

@end

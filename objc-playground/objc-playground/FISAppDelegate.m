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
    
//    FISWarship *ussMissouri = [[FISWarship alloc] initWithShipName:@"USS Missouri"
//                                               currentSpeedInKnots:0
//                                               maximumSpeedInKnots:33];
//    
//    NSLog(@"Ship's Name: %@", ussMissouri.shipName);
//    NSLog(@"Current Speed: %lu", ussMissouri.currentSpeedInKnots);
//    NSLog(@"Maximum Speed: %lu", ussMissouri.maximumSpeedInKnots);
//    
//    [ussMissouri aheadOneHalfSpeed];
//    [ussMissouri fullStop];
//    [ussMissouri fullSpeedAhead];
//    
////    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
////                                                                    ascending:YES];
//    
////    NSSortDescriptor *sortByNameAsc = [[NSSortDescriptor alloc] initWithKey:@"name"
////                                                                  ascending:YES];
//    
////    NSSortDescriptor *sortByNameAsc = [[NSSortDescriptor alloc] init];
////    sortByNameAsc.key = @"name";
////    sortByNameAsc.ascending = YES;
//    
    NSArray *instructors = [[NSArray alloc] initWithObjects:(const id[5]){ @"Joe", @"Tim", @"Tom", @"Jim", @"Mark" } count:5];
    
    NSLog(@"%@", instructors);
//
//    NSMutableArray *instructors = [[NSMutableArray alloc] init];
//    [instructors addObjectsFromArray:@[@"Joe", @"Tim", @"Tom", @"Jim", @"Mark"]];
//
//    NSLog(@"%@", instructors);
//    
//    FISWarship *ship = [[FISWarship alloc] init];
//    FISWarship *boat = [[FISWarship alloc] init];
//    
//    NSLog(@"%@ - Max: %lu", ship.shipName, ship.maximumSpeedInKnots);
//    NSLog(@"%@ - Max: %lu", boat.shipName, boat.maximumSpeedInKnots);
//
//    FISWarship *ussNewJersey = [[FISWarship alloc] initWithShipName:@"USS New Jersey"];
//    FISWarship *ussWisconsin = [[FISWarship alloc] initWithShipName:@"USS Wisconsin"
//                                                maximumSpeedInKnots:33];
//    
//    NSLog(@"%@ - Speed: %lu - Max: %lu", ussNewJersey.shipName, ussNewJersey.currentSpeedInKnots, ussNewJersey.maximumSpeedInKnots);
//    NSLog(@"%@ - Speed: %lu - Max: %lu", ussWisconsin.shipName, ussWisconsin.currentSpeedInKnots, ussWisconsin.maximumSpeedInKnots);
    
    return YES;
}

@end

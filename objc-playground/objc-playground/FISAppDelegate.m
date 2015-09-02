//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISWarship.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // For Code-Along: Interpolate!
    NSLog(@"Interpolate!");
    NSLog(@"%@", @"Interpolate!");
    NSLog(@"%@ %@", @"Interpolate!", @"Interpolate!");
    NSLog(@"%@%@%@%@%@", @"In", @"ter", @"po", @"late", @"!");
    NSLog(@"%@-%@-%@-%@%@", @"In", @"ter", @"po", @"late", @"!");
    
    NSLog(@"Dalek");
    NSLog(@"%@", @"Dalek");
    NSLog(@"%@%@%@%@%@", @"D", @"a", @"l", @"e", @"k");
    
    NSLog(@"You are not The Doctor!");
    NSLog(@"%@", @"You are not The Doctor!");
    NSLog(@"%@%@%@%@%@", @"You", @"are", @"not", @"The", @"Doctor");
    NSLog(@"%@ %@ %@ %@ %@!", @"You", @"are", @"not", @"The", @"Doctor");
    NSLog(@"You are %@ %@!", @"not", @"The Doctor");
    
    
    
    
    
    
    NSInteger i = 0;
    NSUInteger u = 0;
    CGFloat f = 0.0;
    BOOL isFalse = NO;
    
    NSInteger j = 1;
    NSUInteger v = 1;
    CGFloat g = 1.0;
    BOOL isTrue = YES;
    
    NSLog(@"%li", i);
    NSLog(@"%li", j);
    NSLog(@"%lu", u);
    NSLog(@"%lu", v);
    NSLog(@"%f", f);
    NSLog(@"%f", g);
    NSLog(@"%d", isFalse);
    NSLog(@"%d", isTrue);
    
    NSLog(@"i: %li", i);
    NSLog(@"j: %li", j);
    NSLog(@"u: %lu", u);
    NSLog(@"v: %lu", v);
    NSLog(@"f: %f", f);
    NSLog(@"g: %f", g);
    NSLog(@"isFalse: %d", isFalse);
    NSLog(@"isTrue: %d", isTrue);
    
    NSInteger a = 1 + 1;
    NSInteger b = 2 + 2;
    NSInteger c = a + b;
    NSInteger d = 30 + a + c - 9;

    NSLog(@"a: %li, b: %li, c: %li, d: %li", a, b, c, d);
    
    
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
//    NSArray *instructors = [[NSArray alloc] initWithObjects:(const id[5]){ @"Joe", @"Tim", @"Tom", @"Jim", @"Mark" } count:5];
//    
//    NSLog(@"%@", instructors);
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

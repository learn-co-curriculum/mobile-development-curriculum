//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISWarship.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
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
    
    i = 10;
    j = -10;
    u = 21;
    v = 42;
    f = 3.1415926536;
    g = 1.6180398875;
    isFalse = YES;
    isTrue = NO;
    
    NSLog(@"i: %li", i);
    NSLog(@"j: %li", j);
    NSLog(@"u: %lu", u);
    NSLog(@"v: %lu", v);
    NSLog(@"f: %f", f);
    NSLog(@"g: %f", g);
    NSLog(@"isFalse: %d", isFalse);
    NSLog(@"isTrue: %d", isTrue);

    
    NSInteger a = 1 + 1;
    NSInteger b = 7 - 2;
    NSInteger c = 3 * 4;
    NSInteger d = 21 / 3;
    NSInteger e = 13 % 7;
    
    NSLog(@"a: %li, b: %li, c: %li, d: %li, e: %li", a, b, c, d, e);
    
    NSInteger ab = a + b;
    NSInteger cd = c * d;
    
    NSLog(@"ab: %li, cd: %li", ab, cd);
    
    NSInteger k = 0;
    k++;
    NSLog(@"k: %li", k);
    k++;
    NSLog(@"k: %li", k);
    k++;
    NSLog(@"k: %li", k);
    
    NSInteger l = 10;
    l--;
    NSLog(@"l: %li", l);
    l--;
    NSLog(@"l: %li", l);
    l--;
    NSLog(@"l: %li", l);

    CGFloat m = 1.41421356237;
    NSLog(@"m: %f", m);
    m++;
    NSLog(@"m: %f", m);
    m++;
    NSLog(@"m: %f", m);
    m++;
    NSLog(@"m: %f", m);
    
    NSInteger sum = 7;
    NSLog(@"sum: %li", sum);
    sum += 6;
    NSLog(@"sum: %li", sum);
    
    NSInteger diff = 7;
    NSLog(@"diff: %li", diff);
    diff -= 10;
    NSLog(@"diff: %li", diff);
    
    NSInteger product = 5;
    NSLog(@"product: %li", product);
    product *= 3;
    NSLog(@"product: %li", product);
    
    NSInteger quotient = 27;
    NSLog(@"quotient: %li", quotient);
    quotient /= 5;
    NSLog(@"quotient: %li", quotient);
    
    NSInteger remainder = 27;
    NSLog(@"remainder: %li", remainder);
    remainder %= 5;
    NSLog(@"remainder: %li", remainder);
    
    
    
    BOOL isEqualTo            = 7 == 7;
    BOOL isNotEqualTo         = 7 != 7;
    BOOL lessThan             = 5 < 7;
    BOOL lessThanOrEqualTo    = 7.0 <= 7;
    BOOL greaterThan          = 8 > 7;
    BOOL greaterThanOrEqualTo = 7.01 > 7;
    
    NSLog(@"isEqualTo: %d", isEqualTo);
    NSLog(@"isNotEqualTo: %d", isNotEqualTo);
    NSLog(@"lessThan: %d", lessThan);
    NSLog(@"lessThanOrEqualTo: %d", lessThanOrEqualTo);
    NSLog(@"greaterThan: %d", greaterThan);
    NSLog(@"greaterThanOrEqualTo: %d", greaterThanOrEqualTo);
    
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



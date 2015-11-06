//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "NSString+Elide.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *brightStar = @"Bright star, would I were stedfast as thou art";
    
    NSString *elision = [brightStar fis_elideStringToLength:20];
    
    NSLog(@"%@", elision);
    NSLog(@"%lu", elision.length);
    
    
    
    
//    NSDictionary *hashketball = @{ @"away" : @{ @"name" : @"Charlotte Hornets",
//                                                @"colors" : @[ @"Turquoise", @"Purple"],
//                                                @"players" : @[ @{ @"name" : @"Jeff Adrien",
//                                                                   @"number" : @4,
//                                                                   @"shoe" : @18,
//                                                                   @"points" : @10,
//                                                                   @"rebounds" : @1,
//                                                                   @"assists" : @1,
//                                                                   @"steals" : @2,
//                                                                   @"blocks" : @7,
//                                                                   @"slam dunks" : @2
//                                                                   },
//                                                                @{ @"name" : @"Bismak Biyombo",
//                                                                   @"number" : @0,
//                                                                   @"shoe" : @16,
//                                                                   @"points" : @12,
//                                                                   @"rebounds" : @4,
//                                                                   @"assists" : @7,
//                                                                   @"steals" : @7,
//                                                                   @"blocks" : @15,
//                                                                   @"slam dunks" : @10
//                                                                   },
//                                                                @{ @"name" : @"DeSagna Diop",
//                                                                   @"number" : @2,
//                                                                   @"shoe" : @14,
//                                                                   @"points" : @24,
//                                                                   @"rebounds" : @12,
//                                                                   @"assists" : @12,
//                                                                   @"steals" : @4,
//                                                                   @"blocks" : @5,
//                                                                   @"slam dunks" : @6
//                                                                   },
//                                                                @{ @"name" : @"Ben Gordon",
//                                                                   @"number" : @8,
//                                                                   @"shoe" : @15,
//                                                                   @"points" : @33,
//                                                                   @"rebounds" : @3,
//                                                                   @"assists" : @2,
//                                                                   @"steals" : @1,
//                                                                   @"blocks" : @1,
//                                                                   @"slam dunks" : @0
//                                                                   },
//                                                                @{ @"name" : @"Brendan Haywood",
//                                                                   @"number" : @33,
//                                                                   @"shoe" : @15,
//                                                                   @"points" : @6,
//                                                                   @"rebounds" : @12,
//                                                                   @"assists" : @12,
//                                                                   @"steals" : @22,
//                                                                   @"blocks" : @5,
//                                                                   @"slam dunks" : @12
//                                                                   }
//                                                                ]
//                                                },
//                                   @"home" : @{ @"name" : @"Brooklyn Nets",
//                                                @"colors" : @[ @"Black", @"White"],
//                                                @"players" : @[
//                                                        @{ @"name" : @"Alan Anderson",
//                                                           @"number" : @0,
//                                                           @"shoe" : @16,
//                                                           @"points" : @22,
//                                                           @"rebounds" : @12,
//                                                           @"assists" : @12,
//                                                           @"steals" : @3,
//                                                           @"blocks" : @1,
//                                                           @"slam dunks" : @1
//                                                           },
//                                                        @{ @"name" : @"Reggie Evans",
//                                                           @"number" : @30,
//                                                           @"shoe" : @14,
//                                                           @"points" : @12,
//                                                           @"rebounds" : @12,
//                                                           @"assists" : @12,
//                                                           @"steals" : @12,
//                                                           @"blocks" : @12,
//                                                           @"slam dunks" : @7
//                                                           },
//                                                        @{ @"name" : @"Brook Lopez",
//                                                           @"number" : @11,
//                                                           @"shoe" : @17,
//                                                           @"points" : @17,
//                                                           @"rebounds" : @19,
//                                                           @"assists" : @10,
//                                                           @"steals" : @3,
//                                                           @"blocks" : @1,
//                                                           @"slam dunks" : @15
//                                                           },
//                                                        @{ @"name" : @"Mason Plumlee",
//                                                           @"number" : @1,
//                                                           @"shoe" : @19,
//                                                           @"points" : @26,
//                                                           @"rebounds" : @12,
//                                                           @"assists" : @6,
//                                                           @"steals" : @3,
//                                                           @"blocks" : @8,
//                                                           @"slam dunks" : @5
//                                                           },
//                                                        @{ @"name" : @"Jason Terry",
//                                                           @"number" : @31,
//                                                           @"shoe" : @15,
//                                                           @"points" : @19,
//                                                           @"rebounds" : @2,
//                                                           @"assists" : @2,
//                                                           @"steals" : @4,
//                                                           @"blocks" : @11,
//                                                           @"slam dunks" : @1
//                                                           }
//                                                        ]
//                                                }
//                                   };
//    
//    NSLog(@"%@", hashketball);
//    
//    NSPredicate *stealsGreaterThan5Predicate = [NSPredicate predicateWithFormat:@"steals > 5"];
//    NSMutableArray *stealsGreaterThan5 = [[NSMutableArray alloc] init];
//    
//    NSArray *awayPlayers = hashketball[@"away"][@"players"];
//    NSArray *results = [awayPlayers filteredArrayUsingPredicate:stealsGreaterThan5Predicate];
//    [stealsGreaterThan5 addObjectsFromArray:results];
//    
//    NSArray *homePlayers = hashketball[@"home"][@"players"];
//    results = [homePlayers filteredArrayUsingPredicate:stealsGreaterThan5Predicate];
//    [stealsGreaterThan5 addObjectsFromArray:results];
//    
//    NSLog(@"%@", stealsGreaterThan5);
    
    
    
    return YES;
}

@end



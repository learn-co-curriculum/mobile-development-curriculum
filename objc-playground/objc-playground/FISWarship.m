// FISWarship.m

#import "FISWarship.h"

@implementation FISWarship

- (instancetype)init {
    self = [self initWithShipName:@"Mary Celeste"
              currentSpeedInKnots:0
              maximumSpeedInKnots:20];
    return self;
}

- (instancetype)initWithShipName:(NSString *)shipName {
    
    self = [self initWithShipName:shipName
              maximumSpeedInKnots:20];
    return self;
}

- (instancetype)initWithShipName:(NSString *)shipName
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots {
    
    self = [self initWithShipName:shipName
              currentSpeedInKnots:0
              maximumSpeedInKnots:maximumSpeedInKnots];
    return self;
}

- (instancetype)initWithShipName:(NSString *)shipName currentSpeedInKnots:(NSUInteger)currentSpeedInKnots maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots {
    
    self = [super init];
    if (self) {
        _shipName = shipName;
        _currentSpeedInKnots = currentSpeedInKnots;
        _maximumSpeedInKnots = maximumSpeedInKnots;
    }
    return self;
}

- (void)aheadOneHalfSpeed {
    self.currentSpeedInKnots = self.maximumSpeedInKnots / 2;
    NSLog(@"Ahead one half speed, aye!");
}

- (void)fullStop {
    self.currentSpeedInKnots = 0;
    NSLog(@"Full stop, aye!");
}

- (void)fullSpeedAhead {
    self.currentSpeedInKnots = self.maximumSpeedInKnots;
    NSLog(@"Full speed ahead, aye!");
}

@end
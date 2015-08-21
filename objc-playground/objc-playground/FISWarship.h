// FISWarship.h

#import <Foundation/Foundation.h>

@interface FISWarship : NSObject

@property (strong, nonatomic) NSString *shipName;
@property (nonatomic) NSUInteger currentSpeedInKnots;
@property (nonatomic) NSUInteger maximumSpeedInKnots;

- (instancetype)init;
- (instancetype)initWithShipName:(NSString *)shipName;
- (instancetype)initWithShipName:(NSString *)shipName
             currentSpeedInKnots:(NSUInteger)currentSpeedInKnots
             maximumSpeedInKnots:(NSUInteger)maximumSpeedInKnots;

- (void)aheadOneHalfSpeed;
- (void)fullStop;
- (void)fullSpeedAhead;

@end
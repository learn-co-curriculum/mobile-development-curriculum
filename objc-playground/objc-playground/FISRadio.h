//
//  FISRadio.h
//  objc-playground
//
//  Created by Mark Murray on 8/7/15.
//  Copyright (c) 2015 Mark Murray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>    // imports CGFloat

@interface FISRadio : NSObject

@property (nonatomic, readonly) CGFloat amFrequency;
@property (nonatomic, readonly) CGFloat fmFrequency;

- (void)increaseFrequencies;
- (void)decreaseFrequencies;

@end

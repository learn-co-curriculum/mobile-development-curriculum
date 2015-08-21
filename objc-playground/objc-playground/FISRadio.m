//
//  FISRadio.m
//  objc-playground
//
//  Created by Mark Murray on 8/7/15.
//  Copyright (c) 2015 Mark Murray. All rights reserved.
//

#import "FISRadio.h"

@interface FISRadio ()

@property (nonatomic, readwrite) CGFloat amFrequency;
@property (nonatomic, readwrite) CGFloat fmFrequency;

@property (nonatomic, readwrite) BOOL stereo;

@end

@implementation FISRadio

- (instancetype)init {
    return [self initWithAMFrequency:150.0 fmFrequency:91.0];
}

- (instancetype)initWithAMFrequency:(CGFloat)amFrequency fmFrequency:(CGFloat)fmFrequency {
    self = [super init];
    if (self) {
        _amFrequency = amFrequency;
        _fmFrequency = fmFrequency;
    }
    return self;
}

- (void)defaultFrequencies {
    self.amFrequency = 150.0;
    self.fmFrequency = 91.0;
}

- (void)increaseFrequencies {
//    if (!self.amFrequency) {
//        [self defaultFrequencies];
//    }
    
    if (self.amFrequency + 0.5 <= 160.0) {
        self.amFrequency += 0.5;
        self.fmFrequency += 0.1;
    }
}

- (void)decreaseFrequencies {
//    if (!self.amFrequency) {
//        [self defaultFrequencies];
//    }
    
    if (self.amFrequency - 0.5 >= 53.0) {
        self.amFrequency -= 0.5;
        self.fmFrequency -= 0.1;
    }
}

@end

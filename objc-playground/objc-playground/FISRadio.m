//
//  FISRadio.m
//  objc-playground
//
//  Created by Mark Murray on 8/7/15.
//  Copyright (c) 2015 Mark Murray. All rights reserved.
//

#import "FISRadio.h"

@interface FISRadio ()

@property (nonatomic) BOOL power;

@property (nonatomic, readwrite) CGFloat amTuning;
@property (nonatomic, readwrite) CGFloat fmTuning;

@property (nonatomic) BOOL stereo;

@end

@implementation FISRadio

- (void)toggleStereo {
    if (self.stereo) {
        self.stereo = NO;
        NSLog(@"Mono mode selected.");
    } else if (!self.stereo) {
        self.stereo = YES;
        NSLog(@"Stereo mode selected.");
    }
}

@end

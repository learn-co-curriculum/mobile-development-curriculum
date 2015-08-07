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

@property (nonatomic) CGFloat swBal;
@property (nonatomic) CGFloat tuning;

@property (nonatomic, readonly) CGFloat amTuning;
@property (nonatomic, readonly) CGFloat fmTuning;

@property (nonatomic) CGFloat tone;
@property (nonatomic) CGFloat volume;

@property (nonatomic, readonly) BOOL stereo;

@property (nonatomic) CGFloat fmPreset1;
@property (nonatomic) CGFloat fmPreset2;
@property (nonatomic) CGFloat amPreset1;
@property (nonatomic) CGFloat amPreset2;
@property (nonatomic) CGFloat amPreset3;

- (void)toggleStereo;

@end

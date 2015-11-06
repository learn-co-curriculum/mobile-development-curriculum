//
//  NSString+Elide.m
//  objc-playground
//
//  Created by Mark Murray on 9/28/15.
//  Copyright © 2015 Mark Murray. All rights reserved.
//

#import "NSString+Elide.h"

@implementation NSString (Elide)

- (NSString *)fis_elideStringToLength:(NSUInteger)length {
    if (length >= self.length) {
        return self;
    }
    
    NSUInteger index = length - 1;
    NSString *truncated = [self substringToIndex:index];
    NSString *elision = [truncated stringByAppendingString:@"…"];
    
    return elision;

}

@end

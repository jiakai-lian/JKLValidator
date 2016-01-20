//
//  JKLValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import "JKLValidator.h"

@interface JKLValidator () <JKLValidator>

@end

@implementation JKLValidator

- (BOOL)validateWithError:(NSError **)error {
    return YES;
}


- (id <JKLValidator>)validator {
    return self;
}


@end

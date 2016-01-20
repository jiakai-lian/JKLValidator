//
//  JKLValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import "JKLValidator.h"

NSString * const JKLValidatorErrorDomain = @"JKLValidatorErrorDomain";

@interface JKLValidator () <JKLValidator>

@end

@implementation JKLValidator

+ (instancetype)instance
{
    return [[self alloc]init];
}

//- (BOOL)validateWithError:(NSError **)error {
//    return YES;
//}

- (BOOL)validateInput:(id)input error:(NSError **)error
{
    return YES;
}


- (id <JKLValidator>)validator {
    return self;
}


@end

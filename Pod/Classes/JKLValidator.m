//
//  JKLValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import <JKLValidator/JKLValidator.h>
#import "JKLValidator.h"

@interface JKLValidator()<JKLValidable>

@end

@implementation JKLValidator

+ (instancetype)instance
{
    return [[self alloc]init];
}

//- (BOOL)validateWithError:(NSError **)error {
//    return YES;
//}

- (BOOL)validateInput:(id)input error:(NSError * __autoreleasing *)outError
{
    return YES;
}

- (id <JKLValidable>)validator {
    return self;
}


@end

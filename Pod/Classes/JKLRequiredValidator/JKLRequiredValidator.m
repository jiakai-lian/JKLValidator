//
//  JKLRequiredValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import "JKLRequiredValidator.h"

@implementation JKLRequiredValidator

//+ (instancetype)validatorWithInput:(NSObject *)input {
//    return [[self alloc] initWithInput:input];
//}

//- (instancetype)initWithInput:(NSObject *)input {
//    self = [super init];
//    if (self) {
//        _input = [input copy];
//    }
//    return self;
//}

#pragma mark - JKLValidator

//override
//- (BOOL)validateWithError:(NSError **)error {
//    if ([self.input isKindOfClass:[NSString class]]) {
//        return [((NSString *) self.input) stringByTrimmingCharactersInSet:
//                [NSCharacterSet whitespaceAndNewlineCharacterSet]].length;
//    }
//    else if ([self.input respondsToSelector:@selector(count)]) {
//        return [self.input count];
//    }
//    else if ([self.input isEqual:[NSNull null]]) {
//        return NO;
//    }
//
//    return self.input;
//}

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = NO;
    NSString * failureReason = @"";

    if ([input isKindOfClass:[NSString class]]) {
        valid = [((NSString *) input) stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceAndNewlineCharacterSet]].length;
        
        if(!valid)
        {
            failureReason= NSLocalizedString(@"The input string is empty after trimmed.", nil);
        }
    }
    else if ([input respondsToSelector:@selector(count)]) {
        valid = [input count];
        
        if(!valid)
        {
            failureReason= NSLocalizedString(@"The input collection has no items.", nil);
        }
    }
    else if ([input isEqual:[NSNull null]]) {
        valid = NO;
        failureReason= NSLocalizedString(@"The input object is a NSNull object.", nil);
    }
    else {
        valid = input;
        
        if(!valid)
        {
            failureReason= NSLocalizedString(@"The input object is nil.", nil);
        }
    }

    if (!valid) {
        if (outError) {
            *outError = [NSError errorWithDomain:JKLValidatorErrorDomain
                                            code:JKLValidatorErrorCodeInvalidInput
                                        userInfo:@{NSLocalizedFailureReasonErrorKey:failureReason}];
        }
    }

    return valid;
}

@end

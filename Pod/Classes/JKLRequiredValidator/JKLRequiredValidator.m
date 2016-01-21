//
//  JKLRequiredValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import "JKLRequiredValidator.h"

#import "JKLEmptyCollectionValidator.h"
#import "JKLNilValidator.h"

@interface JKLRequiredValidator ()

@property (nonatomic, strong) NSArray<id<JKLValidator>> * subValidators;

@end

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

- (instancetype)init{
    self = [super init];
    if(self)
    {
        _subValidators = @[[JKLEmptyCollectionValidator instance].validator,[JKLNilValidator instance].validator];
    }
    
    return self;
}

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
//    NSString * failureReason = @"";
    
    for(id<JKLValidator> subValidator in self.subValidators)
    {
        valid = [subValidator validateInput:input error:outError];
        
        if(!valid)
        {
            break;
        }
    }

//    if ([input isKindOfClass:[NSString class]]) {
//        valid = [((NSString *) input) stringByTrimmingCharactersInSet:
//                [NSCharacterSet whitespaceAndNewlineCharacterSet]].length;
//        
//        if(!valid)
//        {
//            failureReason= NSLocalizedString(@"The input string is empty after trimmed.", nil);
//        }
//    }
//    else if ([input isEqual:[NSNull null]]) {
//        valid = NO;
//        failureReason= NSLocalizedString(@"The input object is a NSNull object.", nil);
//    }
//    else {
//        valid = input;
//        
//        if(!valid)
//        {
//            failureReason= NSLocalizedString(@"The input object is nil.", nil);
//        }
//    }

//    if (!valid) {
//        if (outError) {
//            *outError = [NSError errorWithDomain:JKLValidatorErrorDomain
//                                            code:JKLValidatorErrorCodeInvalidInput
//                                        userInfo:@{NSLocalizedFailureReasonErrorKey:failureReason}];
//        }
//    }

    return valid;
}

@end

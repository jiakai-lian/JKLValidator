//
//  JKLNotEmptyTrimmedStringValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotEmptyTrimmedStringValidator.h"

#import "JKLIsStringValidator.h"
#import "JKLNotNilValidator.h"
#import "NSError+JKLValidator.h"
#import "NSArray+JKLValidator.h"

@interface JKLNotEmptyTrimmedStringValidator ()

@property(nonatomic, strong) NSArray<id <JKLValidable>> *subValidators;

@end

@implementation JKLNotEmptyTrimmedStringValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [self.subValidators andValidateInput:input
                                                error:outError];

    if (valid && ![((NSString *) input)
            stringByTrimmingCharactersInSet:
                    [NSCharacterSet whitespaceAndNewlineCharacterSet]]
            .length) {
        valid = NO;

        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                             errorCode:(NSInteger)JKLValidatorErrorCodeInvalidInput
                              userInfo:@{NSLocalizedFailureReasonErrorKey :
                                             NSLocalizedString(@"The input string is empty after trimmed.", nil)}
                                 error:outError];
    }

    return valid;
}

- (NSArray *)subValidators {
    if (!_subValidators) {
        _subValidators = @[[JKLNotNilValidator instance].validable,
                           [JKLIsStringValidator instance].validable];
    }
    return _subValidators;
}

@end

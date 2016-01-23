//
//  JKLNotEmptyTrimmedStringValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotEmptyTrimmedStringValidator.h"

#import "JKLValidator+NSError.h"
#import "JKLNotNilValidator.h"
#import "JKLIsStringValidator.h"

@interface JKLNotEmptyTrimmedStringValidator ()

@property(nonatomic, strong) JKLNotNilValidator *notNilValidator;

@property(nonatomic, strong) NSArray<id <JKLValidable>> *subValidators;

@end

@implementation JKLNotEmptyTrimmedStringValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [self andValidateByValidators:self.subValidators
                                         input:input
                                         error:outError];

    if (valid) {
        valid = [((NSString *) input)
                stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceAndNewlineCharacterSet]]
                .length;

        if (!valid) {

            [self getErrorByErrorCode:JKLValidatorErrorCodeInvalidInput
                             userInfo:@{NSLocalizedFailureReasonErrorKey :
                                        NSLocalizedString(@"The input string is empty after trimmed.", nil)}
                                error:outError];
        }
    }

    return valid;
}

- (NSArray *)subValidators {
    if (!_subValidators) {
        _subValidators = @[[JKLNotNilValidator instance].validator,
                           [JKLIsStringValidator instance].validator];
    }
    return _subValidators;
}

@end

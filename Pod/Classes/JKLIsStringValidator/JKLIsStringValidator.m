//
// Created by Jacky on 23/01/2016.
//

#import "JKLIsStringValidator.h"

#import "NSError+JKLValidator.h"


@interface JKLIsStringValidator ()

@end

@implementation JKLIsStringValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [input isKindOfClass:[NSString class]];


    if(!valid)
    {
        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                             errorCode:JKLValidatorErrorCodeInvalidInput
                              userInfo:@{NSLocalizedFailureReasonErrorKey:NSLocalizedString(@"The input is not a string object", nil)}
                                 error:outError];
    }

    return valid;
};

@end
//
// Created by Jacky on 23/01/2016.
//

#import "JKLIsStringValidator.h"

#import "JKLValidator+NSError.h"


@interface JKLIsStringValidator ()

@end

@implementation JKLIsStringValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [input isKindOfClass:[NSString class]];


    if(!valid)
    {
        [self getErrorByErrorCode:JKLValidatorErrorCodeInvalidInput
                         userInfo:@{NSLocalizedFailureReasonErrorKey:@"The input is not a string object"}
                            error:outError];
    }

    return valid;
};

@end
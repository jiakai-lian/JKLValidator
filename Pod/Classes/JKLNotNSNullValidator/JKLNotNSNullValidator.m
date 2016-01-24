//
//  JKLNotNSNullValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotNSNullValidator.h"

#import "JKLNotNilValidator.h"
#import "NSError+JKLValidator.h"

@interface JKLNotNSNullValidator ()

@property(nonatomic, strong) id <JKLValidable> notNilValidator;
@end

@implementation JKLNotNSNullValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [self.notNilValidator validateInput:input
                                               error:outError];

    valid = valid && ![input isEqual:[NSNull null]];

    if (!valid) {
        NSString *failureReason =
                         NSLocalizedString(@"The input object is a NSNull object.", nil);

        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                             errorCode:(NSInteger)JKLValidatorErrorCodeInvalidInput
                              userInfo:@{NSLocalizedFailureReasonErrorKey :
                                             failureReason}
                                 error:outError];
    }

    return valid;
}

- (id <JKLValidable>)notNilValidator {
    if (!_notNilValidator) {
        _notNilValidator = [JKLNotNilValidator instance].validable;
    }
    return _notNilValidator;
}

@end

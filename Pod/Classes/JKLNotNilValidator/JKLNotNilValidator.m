//
//  JKLNotNilValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotNilValidator.h"

#import "NSError+JKLValidator.h"

@implementation JKLNotNilValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL     valid          = (BOOL)input;

    if (!valid) {
        NSString * failureReason = NSLocalizedString(@"The input object is nil.", nil);
        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                             errorCode:(NSInteger)JKLValidatorErrorCodeInvalidInput
                              userInfo:@{NSLocalizedFailureReasonErrorKey :
                                             failureReason}
                                 error:outError];
    }

    return valid;
}

@end

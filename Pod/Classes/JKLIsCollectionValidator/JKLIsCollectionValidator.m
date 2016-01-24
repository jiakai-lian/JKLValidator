//
// Created by Jacky on 23/01/2016.
//

#import "JKLIsCollectionValidator.h"

#import "NSError+JKLValidator.h"

@interface JKLIsCollectionValidator ()

@end

@implementation JKLIsCollectionValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL     valid          = [input respondsToSelector:@selector(count)];

    if (!valid) {
        NSString * failureReason = NSLocalizedString(@"The input object is not a collection.", nil);
        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                             errorCode:(NSInteger)JKLValidatorErrorCodeInvalidInput
                              userInfo:@{NSLocalizedFailureReasonErrorKey :
                                             failureReason}
                                 error:outError];    }

    return valid;
}

@end
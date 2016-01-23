//
//  JKLNotNilValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotNilValidator.h"

#import "JKLValidator+NSError.h"

@implementation JKLNotNilValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL     valid          = (BOOL)input;

    if (!valid) {
        NSString * failureReason = NSLocalizedString(@"The input object is nil.", nil);
        [self getErrorByErrorCode:JKLValidatorErrorCodeInvalidInput
                         userInfo:@{NSLocalizedFailureReasonErrorKey : failureReason}
                            error:outError];
    }

    return valid;
}

@end

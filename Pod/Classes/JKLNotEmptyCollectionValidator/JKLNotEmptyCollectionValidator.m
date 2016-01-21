//
//  JKLNotEmptyCollectionValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotEmptyCollectionValidator.h"

@implementation JKLNotEmptyCollectionValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = YES;
    NSString *failureReason = nil;
    
    if ([input respondsToSelector:@selector(count)]) {
        valid = [input count];
        
        if(!valid)
        {
            failureReason= NSLocalizedString(@"The input collection has no items.", nil);
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

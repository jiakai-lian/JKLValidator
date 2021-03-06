//
//  JKLNotEmptyCollectionValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotEmptyCollectionValidator.h"

#import "JKLIsCollectionValidator.h"
#import "JKLNotNilValidator.h"
#import "NSError+JKLValidator.h"
#import "NSArray+JKLValidator.h"

@interface JKLNotEmptyCollectionValidator ()

@property(nonatomic, strong) NSArray<id <JKLValidable>> *subValidators;

@end

@implementation JKLNotEmptyCollectionValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [self.subValidators andValidateInput:input
                                                error:outError];

    if (valid && ![input count]) {
        valid = NO;
        NSString *failureReason = NSLocalizedString(@"The input collection has no items.", nil);
        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                             errorCode:(NSInteger)JKLValidatorErrorCodeInvalidInput
                              userInfo:@{NSLocalizedFailureReasonErrorKey :
                                             failureReason}
                                 error:outError];
    }

    return valid;
}

- (NSArray *)subValidators {
    if (!_subValidators) {
        _subValidators = @[[JKLNotNilValidator instance].validable,
                           [JKLIsCollectionValidator instance].validable];
    }
    return _subValidators;
}

@end

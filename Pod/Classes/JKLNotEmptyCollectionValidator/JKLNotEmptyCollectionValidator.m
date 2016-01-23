//
//  JKLNotEmptyCollectionValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotEmptyCollectionValidator.h"

#import "JKLValidator+NSError.h"
#import "JKLIsCollectionValidator.h"
#import "JKLNotNilValidator.h"
#import "NSArray+JKLValidator.h"

@interface JKLNotEmptyCollectionValidator()

@property(nonatomic, strong) NSArray<id <JKLValidable>> *subValidators;

@end

@implementation JKLNotEmptyCollectionValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [self.subValidators andValidateInput:input
                                                error:outError];
    
    if (valid) {
        valid =  [input count];
        if(!valid)
        {
        NSString *failureReason= NSLocalizedString(@"The input collection has no items.", nil);
        [self getErrorByErrorCode:JKLValidatorErrorCodeInvalidInput
                         userInfo:@{NSLocalizedFailureReasonErrorKey : failureReason}
                            error:outError];
        }
    }
    
    return valid;
}

- (NSArray *)subValidators {
    if (!_subValidators) {
        _subValidators = @[[JKLNotNilValidator instance].validator,
                           [JKLIsCollectionValidator instance].validator];
    }
    return _subValidators;
}

@end

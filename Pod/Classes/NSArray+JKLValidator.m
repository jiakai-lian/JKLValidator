//
// Created by Jacky on 23/01/2016.
//

#import "NSArray+JKLValidator.h"

#import "JKLValidator.h"

@implementation NSArray (JKLValidator)

#pragma mark - Life Cycle

#pragma mark - Delegates

#pragma mark - Event Handling

#pragma mark - Private Methods

#pragma mark - Private Getters and Setters

#pragma mark - Public Methods

- (BOOL)orValidateInput:(id)input
                   error:(NSError *__autoreleasing *)outError {
    BOOL valid = NO;

    if (self.count) {
        for (id <JKLValidable> validable in self) {
            valid = valid || [validable validateInput:input
                                                error:outError];
            if (valid) {
                *outError = nil;
                break;
            }
        }
    }

    return valid;
}

- (BOOL)andValidateInput:(id)input
                   error:(NSError *__autoreleasing *)outError {
    BOOL valid = YES;

    if (self.count) {
        for (id <JKLValidable> validable in self) {
            valid = valid && [validable validateInput:input
                                                error:outError];
            if (!valid) {
                break;
            }
        }
    }

    return valid;
}


#pragma mark - Public Getters and Setters

@end
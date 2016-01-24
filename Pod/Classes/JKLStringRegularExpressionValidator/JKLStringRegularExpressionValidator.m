//
// Created by Jacky on 23/01/2016.
//

#import "JKLStringRegularExpressionValidator.h"

#import "NSArray+JKLValidator.h"
#import "NSError+JKLValidator.h"
#import "JKLIsStringValidator.h"

@interface JKLStringRegularExpressionValidator ()

@property(nonatomic, strong) id <JKLValidable> isStringValidable;

@end

@implementation JKLStringRegularExpressionValidator
- (instancetype)initWithRegularExpression:(NSRegularExpression *)regex {
    self = [super init];

    if (self) {
        _regex = regex.copy;
    }

    return self;
}

+ (instancetype)instanceWithRegularExpression:(NSRegularExpression *)regex {
    return [[self alloc] initWithRegularExpression:regex];
}


- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = [self.isStringValidable validateInput:input
                                                 error:outError];

    if (valid && !self.regex) {
        valid = NO;
        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                          errorCode:(NSInteger)JKLValidatorErrorCodeNilParameter
                           userInfo:@{NSLocalizedFailureReasonErrorKey :
                                          NSLocalizedString(@"The regular expression is not set", nil)}
                                 error:outError];
    }

    NSString *inputString = (NSString *) input;

    if (valid && ![self.regex firstMatchInString:inputString
                                         options:0
                                           range:NSMakeRange(0, inputString.length)]) {
        valid = NO;
        [NSError getErrorByErrorDomain:JKLValidatorErrorDomain
                             errorCode:(NSInteger)JKLValidatorErrorCodeInvalidInput
                              userInfo:@{NSLocalizedFailureReasonErrorKey :
                                             NSLocalizedString(@"The input object doesn't match the given regular expression", nil)}
                                 error:outError];
    }

    return valid;
}

- (id <JKLValidable>)isStringValidable {
    if (!_isStringValidable) {
        _isStringValidable = [JKLIsStringValidator instance].validable;
    }
    return _isStringValidable;
}

@end
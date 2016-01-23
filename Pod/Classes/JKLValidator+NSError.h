//
// Created by Jacky on 23/01/2016.
//

#import <JKLValidator/JKLValidator.h>

FOUNDATION_EXTERN NSString * const JKLValidatorErrorDomain;

typedef NS_ENUM(NSUInteger, JKLValidatorErrorCode) {
    JKLValidatorErrorCodeInvalidInput = 0,
};


@interface JKLValidator (NSError)

- (void)getErrorByErrorCode:(JKLValidatorErrorCode)code
                   userInfo:(NSDictionary *)userInfo
                      error:(NSError *__autoreleasing *)outError;
@end
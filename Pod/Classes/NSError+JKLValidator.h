//
//  NSError+JKLValidator.h
//  Pods
//
//  Created by Jacky on 25/01/2016.
//
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString * const JKLValidatorErrorDomain;

typedef NS_ENUM(NSUInteger, JKLValidatorErrorCode) {
    JKLValidatorErrorCodeUnknownError = 0,
    JKLValidatorErrorCodeInvalidInput = 1,
    JKLValidatorErrorCodeNilParameter = 2,
};

@interface NSError (JKLValidator)

+ (void)getErrorByErrorDomain:(NSString *)domain
                    errorCode:(NSInteger)code
                     userInfo:(NSDictionary *)userInfo
                        error:(NSError *__autoreleasing *)outError;

@end

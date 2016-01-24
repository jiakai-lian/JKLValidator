//
//  NSError+JKLValidator.m
//  Pods
//
//  Created by Jacky on 25/01/2016.
//
//

#import "NSError+JKLValidator.h"

NSString * const JKLValidatorErrorDomain = @"JKLValidatorErrorDomain";

@implementation NSError (JKLValidator)

+ (void)getErrorByErrorDomain:(NSString *)domain
                    errorCode:(NSInteger)code
                   userInfo:(NSDictionary *)userInfo
                      error:(NSError *__autoreleasing *)outError {
    if (outError) {
        *outError = [NSError errorWithDomain:domain
                                        code:code
                                    userInfo:userInfo];
    }
}

@end

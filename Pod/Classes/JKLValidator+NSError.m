//
// Created by Jacky on 23/01/2016.
//

#import "JKLValidator+NSError.h"

NSString * const JKLValidatorErrorDomain = @"JKLValidatorErrorDomain";

@implementation JKLValidator (NSError)

- (void)getErrorByErrorCode:(JKLValidatorErrorCode)code
                   userInfo:(NSDictionary *)userInfo
                      error:(NSError *__autoreleasing *)outError {
    if (outError) {
        *outError = [NSError errorWithDomain:JKLValidatorErrorDomain
                                        code:code
                                    userInfo:userInfo];
    }
}

@end
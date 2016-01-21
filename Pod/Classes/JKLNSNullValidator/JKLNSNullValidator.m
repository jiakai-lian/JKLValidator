//
//  JKLNSNullValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNSNullValidator.h"

@implementation JKLNSNullValidator

- (BOOL)validateInput:(id)input error:(NSError *__autoreleasing *)outError {
  BOOL valid = YES;
  NSString *failureReason = nil;

  if ([input isEqual:[NSNull null]]) {
    valid = NO;
    failureReason =
        NSLocalizedString(@"The input object is a NSNull object.", nil);

    if (outError) {
      *outError = [NSError
          errorWithDomain:JKLValidatorErrorDomain
                     code:JKLValidatorErrorCodeInvalidInput
                 userInfo:@{NSLocalizedFailureReasonErrorKey : failureReason}];
    }
  }

  return valid;
}

@end

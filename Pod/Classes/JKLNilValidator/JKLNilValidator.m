//
//  JKLNilValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNilValidator.h"

@implementation JKLNilValidator

- (BOOL)validateInput:(id)input error:(NSError *__autoreleasing *)outError {
  BOOL valid = input;
  NSString *failureReason = nil;

  if (!valid) {
    failureReason = NSLocalizedString(@"The input object is nil.", nil);
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

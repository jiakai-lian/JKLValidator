//
//  JKLNotNilValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotNilValidator.h"

@implementation JKLNotNilValidator

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

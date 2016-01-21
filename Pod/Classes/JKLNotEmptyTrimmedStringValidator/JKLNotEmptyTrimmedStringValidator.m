//
//  JKLNotEmptyTrimmedStringValidator.m
//  Pods
//
//  Created by jiakai lian on 21/01/2016.
//
//

#import "JKLNotEmptyTrimmedStringValidator.h"

@implementation JKLNotEmptyTrimmedStringValidator

- (BOOL)validateInput:(id)input error:(NSError *__autoreleasing *)outError {
  BOOL valid = YES;
  NSString *failureReason = nil;

  if ([input isKindOfClass:[NSString class]]) {
    valid = [((NSString *)input)
                stringByTrimmingCharactersInSet:
                    [NSCharacterSet whitespaceAndNewlineCharacterSet]]
                .length;

    if (!valid) {
      failureReason =
          NSLocalizedString(@"The input string is empty after trimmed.", nil);
      if (outError) {
        *outError =
            [NSError errorWithDomain:JKLValidatorErrorDomain
                                code:JKLValidatorErrorCodeInvalidInput
                            userInfo:@{
                              NSLocalizedFailureReasonErrorKey : failureReason
                            }];
      }
    }
  }

  return valid;
}

@end

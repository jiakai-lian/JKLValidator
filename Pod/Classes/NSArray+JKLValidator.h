//
// Created by Jacky on 23/01/2016.
//

#import <Foundation/Foundation.h>

@protocol JKLValidable;

@interface NSArray (JKLValidator)

- (BOOL)orValidateInput:(id)input
                  error:(NSError *__autoreleasing *)outError;

- (BOOL)andValidateInput:(id)input
                   error:(NSError *__autoreleasing *)outError;
@end
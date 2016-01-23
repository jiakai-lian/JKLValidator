//
//  JKLValidator.h
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import <Foundation/Foundation.h>

@protocol JKLValidable <NSObject>

@required

//- (BOOL)validateWithError:(NSError **)error;
- (BOOL)validateInput:(id)input error:(NSError * __autoreleasing *)error;

@end

@interface JKLValidator : NSObject

@property(nonatomic, weak, readonly) id <JKLValidable> validator;

- (BOOL)andValidateByValidators:(NSArray<id <JKLValidable>> *)validators
                          input:(id)input
                          error:(NSError * __autoreleasing *)outError;
- (BOOL)orValidateByValidators:(NSArray<id <JKLValidable>> *)validators
                         input:(id)input
                         error:(NSError * __autoreleasing *)outError;


+ (instancetype)instance;

@end

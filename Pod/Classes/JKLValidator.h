//
//  JKLValidator.h
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const JKLValidatorErrorDomain;

typedef NS_ENUM(NSUInteger, JKLValidatorErrorCode) {
    JKLValidatorErrorCodeInvalidInput = 0,
};


@protocol JKLValidator <NSObject>

@required

//- (BOOL)validateWithError:(NSError **)error;
- (BOOL)validateInput:(id)input error:(NSError * __autoreleasing *)error;

@end

@interface JKLValidator : NSObject

@property(nonatomic, strong, readonly) id <JKLValidator> validator;

+ (instancetype)instance;

@end

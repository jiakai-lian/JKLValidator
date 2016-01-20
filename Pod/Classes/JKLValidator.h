//
//  JKLValidator.h
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import <Foundation/Foundation.h>

@protocol JKLValidator <NSObject>

@required

//- (BOOL)validateWithError:(NSError **)error;
- (BOOL)validateInput:(id)input error:(NSError **)error;

@end

@interface JKLValidator : NSObject

@property(nonatomic, strong, readonly) id <JKLValidator> validator;

+ (instancetype)instance;

@end

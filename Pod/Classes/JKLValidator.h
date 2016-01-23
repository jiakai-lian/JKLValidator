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
- (BOOL)validateInput:(id)input error:(NSError * __autoreleasing *)error;

@end

@interface JKLValidator : NSObject

@property(nonatomic, weak, readonly) id <JKLValidable> validable;

+ (instancetype)instance;

@end

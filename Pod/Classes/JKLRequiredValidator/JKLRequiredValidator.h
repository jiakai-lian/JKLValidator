//
//  JKLRequiredValidator.h
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import "JKLValidator.h"

@interface JKLRequiredValidator
<ObjectType: NSObject *> : JKLValidator

@property(nonatomic, copy, readonly) ObjectType input;

+ (instancetype)validatorWithInput:(NSObject *)input;
- (instancetype)initWithInput:(ObjectType)input;

@end

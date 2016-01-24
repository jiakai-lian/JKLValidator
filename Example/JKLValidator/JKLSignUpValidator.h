//
//  JKLSignUpValidator.h
//  JKLValidator
//
//  Created by Jacky on 24/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <JKLValidator/JKLValidator.h>

@interface JKLSignUpValidator : JKLValidator

- (instancetype)initWithEmailValidators:(NSArray<id<JKLValidable>> *)emailValidators passwordValidators:(NSArray<id<JKLValidable>> *)passwordValidators;
+ (instancetype)instanceWithEmailValidators:(NSArray<id<JKLValidable>> *)emailValidators passwordValidators:(NSArray<id<JKLValidable>> *)passwordValidators;


@end

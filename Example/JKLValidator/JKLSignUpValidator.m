//
//  JKLSignUpValidator.m
//  JKLValidator
//
//  Created by Jacky on 24/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <objc/objc.h>
#import "JKLSignUpValidator.h"
#import "NSArray+JKLValidator.h"

@interface JKLSignUpValidator ()
@property(nonatomic, copy) NSArray<id <JKLValidable>> *emailValidators;
@property(nonatomic, copy) NSArray<id <JKLValidable>> *passwordValidators;
@end

@implementation JKLSignUpValidator
- (instancetype)initWithEmailValidators:(NSArray<id <JKLValidable>> *)emailValidators
                     passwordValidators:(NSArray<id <JKLValidable>> *)passwordValidators {
    self = [super init];

    if (self) {
        _emailValidators    = [emailValidators copy];
        _passwordValidators = [passwordValidators copy];
    }

    return self;
}

+ (instancetype)instanceWithEmailValidators:(NSArray<id <JKLValidable>> *)emailValidators
                         passwordValidators:(NSArray<id <JKLValidable>> *)passwordValidators {
    return [[self alloc] initWithEmailValidators:emailValidators
                              passwordValidators:passwordValidators];
}

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)error {
    NSAssert([input isKindOfClass:[NSArray class]],@"");

    NSArray<NSString *> *texts = (NSArray<NSString *> *)input;

    NSAssert(texts.count == 2,@"");

    return [self.emailValidators andValidateInput:texts[0]
                                            error:error] &&
            [self.passwordValidators andValidateInput:texts[1]
                                                error:error];
}


@end

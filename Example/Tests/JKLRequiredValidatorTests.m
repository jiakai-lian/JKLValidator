//
//  JKLRequiredValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 19/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi
@import JKLValidator;

SPEC_BEGIN(InitialTests)

describe(@"JKLRequiredValidator Tests", ^{
    
//    let(requiredValidator, ^{ // Occurs before each enclosed "it"
//        return [[JKLRequiredValidator<NSString *> alloc] initWithInput:@""];
//    });
    
    context(@"will fail", ^{
        
//        
//        it(@"can read", ^{
//            [[@"number" should] equal:@"string"];
//        });
//        
//        it(@"will wait and fail", ^{
//            NSObject *object = [[NSObject alloc] init];
//            [[expectFutureValue(object) shouldEventually] receive:@selector(autoContentAccessingProxy)];
//        });
    });
    
    context(@"will pass", ^{
        
        it(@"can verify a non-nil string", ^{
            id validator = [[JKLRequiredValidator<NSString *> alloc] initWithInput:@"a"].validator;
            
            [[validator shouldNot] beNil];
            [[validator should] conformToProtocol:@protocol(JKLValidator)];
            [[theValue([validator validateWithError:nil]) should] beYes];
            
            
        });
        
        it(@"can verify a non-nil string", ^{
            [[JKLRequiredValidator<NSString *> alloc] initWithInput:@"a"];
        });
        
        it(@"can read", ^{
            [[@"team" shouldNot] containString:@"I"];
        });  
    });
    
});

SPEC_END
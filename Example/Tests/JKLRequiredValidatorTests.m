//
//  JKLRequiredValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 19/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

@import JKLValidator;

//SPEC_BEGIN(InitialTests)
//
//describe(@"JKLRequiredValidator Tests", ^{
//    
////    let(requiredValidator, ^{ // Occurs before each enclosed "it"
////        return [[JKLRequiredValidator<NSString *> alloc] initWithInput:@""];
////    });
//    
//    context(@"will fail", ^{
//        
////        
////        it(@"can read", ^{
////            [[@"number" should] equal:@"string"];
////        });
////        
////        it(@"will wait and fail", ^{
////            NSObject *object = [[NSObject alloc] init];
////            [[expectFutureValue(object) shouldEventually] receive:@selector(autoContentAccessingProxy)];
////        });
//    });
//    
//    context(@"will pass", ^{
//        
//        it(@"can verify a non-nil string", ^{
//            id validator = [[JKLRequiredValidator<NSString *> alloc] initWithInput:@"a"].validator;
//            
//            [[validator shouldNot] beNil];
//            [[validator should] conformToProtocol:@protocol(JKLValidator)];
//            [[theValue([validator validateWithError:nil]) should] beYes];
//            
//            
//        });
//        
//        it(@"can verify a non-nil string", ^{
//            [[JKLRequiredValidator<NSString *> alloc] initWithInput:@"a"];
//        });
//        
//        it(@"can read", ^{
//            [[@"team" shouldNot] containString:@"I"];
//        });  
//    });
//    
//});
//
//SPEC_END


 // #import "Specta.h" if you're using libSpecta.a

SpecBegin(JKLRequiredValidator)

describe(@"JKLRequiredValidator Tests", ^{
    
    it(@"should able to verify a non-nil string", ^{
        
        id<JKLValidator> validator = [JKLRequiredValidator<NSString *> validatorWithInput:@"a"].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
        expect([validator validateWithError:nil]).to.equal(YES);
    });
    
    it(@"should able to verify a nil", ^{
        
        id<JKLValidator> validator = [JKLRequiredValidator<NSString *> validatorWithInput:nil].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should do some stuff asynchronously", ^{
        waitUntil(^(DoneCallback done) {
            // Async example blocks need to invoke done() callback.
            done();
        });
    });
});

SpecEnd
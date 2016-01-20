//
//  JKLRequiredValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 19/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

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
    
//    it(@"should do some stuff asynchronously", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            done();
//        });
//    });
});

SpecEnd
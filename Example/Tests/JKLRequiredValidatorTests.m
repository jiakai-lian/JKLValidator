//
//  JKLRequiredValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 19/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

SpecBegin(JKLRequiredValidator)

describe(@"JKLRequiredValidator Tests", ^{
    
    __block id<JKLValidator> validator = nil;
    
    afterEach(^{
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
    });
    
    it(@"should able to verify a meaningful string", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@"string"].validator;

        expect([validator validateWithError:nil]).to.equal(YES);
    });
    
    it(@"should able to verify an empty string", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@""].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an trimmable string", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@" "].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an string contains only spaces", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@"    "].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an string contains only new line characters", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@"\n\n\n"].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an string contains spaces and new line characters", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@" \n \n \n "].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an trimmable string", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@" string \n"].validator;
        
        expect([validator validateWithError:nil]).to.equal(YES);
    });
    
    it(@"should able to verify a nil", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:nil].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify a NSNull object", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:[NSNull null]].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an empty array", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@[]].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify a not empty array", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@[@1]].validator;
        
        expect([validator validateWithError:nil]).to.equal(YES);
    });
    
    it(@"should able to verify an empty dictionary", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@{}].validator;
        
        expect([validator validateWithError:nil]).to.equal(NO);
    });
    
    it(@"should able to verify a not empty dictionary", ^{
        
        validator = [JKLRequiredValidator<NSString *> validatorWithInput:@{@1:@1}].validator;
        
        expect([validator validateWithError:nil]).to.equal(YES);
    });
    
//    it(@"should do some stuff asynchronously", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            done();
//        });
//    });
});

SpecEnd
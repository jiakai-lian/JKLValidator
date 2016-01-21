//
//  JKLRequiredValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 19/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <JKLRequiredValidator.h>

SpecBegin(JKLRequiredValidator)

    describe(@"JKLRequiredValidator Tests", ^{

        __block id <JKLValidator> validator = nil;
        
        beforeAll(^{
            validator = [JKLRequiredValidator instance].validator;
            
            expect(validator).toNot.beNil;
            expect(validator).to.conformTo(@protocol(JKLValidator));
        });

        it(@"should able to verify a meaningful string", ^{

            expect([validator validateInput:@"string" error:nil]).to.equal(YES);
        });

        it(@"should able to verify an empty string", ^{
            expect([validator validateInput:@"" error:nil]).to.equal(NO);
        });


        it(@"should able to verify an string contains only spaces", ^{
            expect([validator validateInput:@"    " error:nil]).to.equal(NO);
        });

        it(@"should able to verify an string contains only new line characters", ^{
            expect([validator validateInput:@"\n\n\n" error:nil]).to.equal(NO);
        });

        it(@"should able to verify an string contains spaces and new line characters", ^{
            expect([validator validateInput:@" \n \n \n " error:nil]).to.equal(NO);
        });

        it(@"should able to verify an trimmable string", ^{
             expect([validator validateInput:@" string \n" error:nil]).to.equal(YES);
        });

        it(@"should able to verify a nil", ^{
            expect([validator validateInput:nil error:nil]).to.equal(NO);
        });

        it(@"should able to verify a NSNull object", ^{
            expect([validator validateInput:[NSNull null] error:nil]).to.equal(NO);
        });

        it(@"should able to verify an empty array", ^{
            expect([validator validateInput:@[] error:nil]).to.equal(NO);
        });

        it(@"should able to verify a not empty array", ^{
            expect([validator validateInput:@[@1] error:nil]).to.equal(YES);
        });

        it(@"should able to verify an empty dictionary", ^{
            expect([validator validateInput:@{} error:nil]).to.equal(NO);
        });

        it(@"should able to verify a not empty dictionary", ^{
            expect([validator validateInput:@{@1 : @1} error:nil]).to.equal(YES);
        });

//    it(@"should do some stuff asynchronously", ^{
//        waitUntil(^(DoneCallback done) {
//            // Async example blocks need to invoke done() callback.
//            done();
//        });
//    });
    });

SpecEnd
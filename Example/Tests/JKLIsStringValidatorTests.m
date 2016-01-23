//
//  JKLIsStringValidatorTests.m
//  JKLValidator
//
//  Created by Jacky on 23/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//
#import <JKLIsStringValidator.h>

SpecBegin(JKLIsStringValidator)

describe(@"JKLIsStringValidator Tests", ^{
    
    __block id <JKLValidable> validator = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validator = [JKLIsStringValidator instance].validator;
        
        expect(validator).toNot.beNil();
        expect(validator).to.conformTo(@protocol(JKLValidable));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to verify an NSNull object", ^{
        expect([validator validateInput:[NSNull null] error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a nil object (nil is not null)", ^{
        expect([validator validateInput:nil error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify an empty string object", ^{
        expect([validator validateInput:@"" error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitary string object", ^{
        expect([validator validateInput:@"arbitrary" error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutable string object", ^{
        expect([validator validateInput:@"".mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitary mutable string object", ^{
        expect([validator validateInput:@"arbitrary".mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });

    
});

SpecEnd

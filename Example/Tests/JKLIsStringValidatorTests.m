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
    
    __block id <JKLValidable> validable = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validable = [JKLIsStringValidator instance].validable;
        
        expect(validable).toNot.beNil();
        expect(validable).to.conformTo(@protocol(JKLValidable));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to verify an NSNull object", ^{
        expect([validable validateInput:[NSNull null]
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a nil object (nil is not null)", ^{
        expect([validable validateInput:nil
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validable validateInput:[[NSObject alloc] init]
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify an empty string object", ^{
        expect([validable validateInput:@""
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitary string object", ^{
        expect([validable validateInput:@"arbitrary"
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutable string object", ^{
        expect([validable validateInput:@"".mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitary mutable string object", ^{
        expect([validable validateInput:@"arbitrary".mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });

    
});

SpecEnd

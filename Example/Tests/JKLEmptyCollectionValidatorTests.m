//
//  JKLEmptyCollectionValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 21/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import "JKLEmptyCollectionValidator.h"

SpecBegin(JKLEmptyCollectionValidator)

describe(@"JKLEmptyCollectionValidator Tests", ^{
    
    __block id <JKLValidator> validator = nil;
    
    beforeAll(^{
        validator = [JKLEmptyCollectionValidator instance].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
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
    
    it(@"should able to verify an empty set", ^{
        expect([validator validateInput:[NSSet set] error:nil]).to.equal(NO);
    });
    
    it(@"should able to verify a not empty set", ^{
        expect([validator validateInput:[NSSet setWithObject:@1] error:nil]).to.equal(YES);
    });
});

SpecEnd
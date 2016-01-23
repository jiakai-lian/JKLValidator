//
//  JKLEmptyCollectionValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 21/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import "JKLNotEmptyCollectionValidator.h"

SpecBegin(JKLNotEmptyCollectionValidator)

describe(@"JKLNotEmptyCollectionValidator Tests", ^{
    
    __block id <JKLValidable> validator = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validator = [JKLNotEmptyCollectionValidator instance].validator;
        
        expect(validator).toNot.beNil();
        expect(validator).to.conformTo(@protocol(JKLValidable));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to verify an empty array", ^{
        expect([validator validateInput:@[] error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a not empty array", ^{
        expect([validator validateInput:@[@1] error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty dictionary", ^{
        expect([validator validateInput:@{} error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a not empty dictionary", ^{
        expect([validator validateInput:@{@1 : @1} error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty set", ^{
        expect([validator validateInput:[NSSet set] error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a not empty set", ^{
        expect([validator validateInput:[NSSet setWithObject:@1] error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify a nil Object", ^{
        expect([validator validateInput:nil error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a NSNull object", ^{
        expect([validator validateInput:[NSNull null] error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
});

SpecEnd
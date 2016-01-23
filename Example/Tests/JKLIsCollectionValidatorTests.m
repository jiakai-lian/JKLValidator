//
//  JKLIsCollectionValidatorTests.m
//  JKLValidator
//
//  Created by Jacky on 23/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <JKLIsCollectionValidator.h>

SpecBegin(JKLIsCollectionValidator)

describe(@"JKLIsCollectionValidator Tests", ^{
    
    __block id <JKLValidable> validator = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validator = [JKLIsCollectionValidator instance].validator;
        
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
    
    it(@"should able to verify an empty array", ^{
        expect([validator validateInput:@[] error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary array", ^{
        expect([validator validateInput:@[@1] error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutable array", ^{
        expect([validator validateInput:@[].mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary mutable array", ^{
        expect([validator validateInput:@[@1].mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty dictionary", ^{
        expect([validator validateInput:@{} error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary array", ^{
        expect([validator validateInput:@{@1:@1} error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutable dictionary", ^{
        expect([validator validateInput:@{}.mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary mutable array", ^{
        expect([validator validateInput:@{@1:@1}.mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty set", ^{
        expect([validator validateInput:[NSSet set] error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary set", ^{
        expect([validator validateInput:[NSSet setWithObject:@""] error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutableCopy set", ^{
        expect([validator validateInput:[NSSet set].mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary mutableCopy set", ^{
        expect([validator validateInput:[NSSet setWithObject:@""].mutableCopy error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
});

SpecEnd
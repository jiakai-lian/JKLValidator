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
    
    __block id <JKLValidable> validable = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validable = [JKLIsCollectionValidator instance].validable;
        
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
    
    it(@"should able to verify an empty array", ^{
        expect([validable validateInput:@[]
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary array", ^{
        expect([validable validateInput:@[@1]
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutable array", ^{
        expect([validable validateInput:@[].mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary mutable array", ^{
        expect([validable validateInput:@[@1].mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty dictionary", ^{
        expect([validable validateInput:@{}
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary array", ^{
        expect([validable validateInput:@{@1 : @1}
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutable dictionary", ^{
        expect([validable validateInput:@{}.mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary mutable array", ^{
        expect([validable validateInput:@{@1 : @1}.mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty set", ^{
        expect([validable validateInput:[NSSet set]
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary set", ^{
        expect([validable validateInput:[NSSet setWithObject:@""]
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an empty mutableCopy set", ^{
        expect([validable validateInput:[NSSet set].mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify an arbitrary mutableCopy set", ^{
        expect([validable validateInput:[NSSet setWithObject:@""].mutableCopy
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
});

SpecEnd
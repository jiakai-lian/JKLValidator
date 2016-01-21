//
//  JKLNotNSNullValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 21/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import "JKLNotNSNullValidator.h"

SpecBegin(JKLNotNSNullValidator)

describe(@"JKLNotNSNullValidator Tests", ^{
    
    __block id <JKLValidator> validator = nil;
    
    beforeAll(^{
        validator = [JKLNotNSNullValidator instance].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
    });
    
    it(@"should able to verify an NSNull object", ^{
        expect([validator validateInput:[NSNull null] error:nil]).to.equal(NO);
    });
    
    it(@"should able to verify a not NSNull object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:nil]).to.equal(YES);
    });
    
    it(@"should able to verify a nil object (nil is not null)", ^{
        expect([validator validateInput:nil error:nil]).to.equal(YES);
    });
    
});

SpecEnd

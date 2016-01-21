//
//  JKLNilValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 21/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import "JKLNilValidator.h"

SpecBegin(JKLNilValidator)

describe(@"JKLNilValidator Tests", ^{
    
    __block id <JKLValidator> validator = nil;
    
    beforeAll(^{
        validator = [JKLNilValidator instance].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
    });
    
    it(@"should able to verify an nil object", ^{
        expect([validator validateInput:nil error:nil]).to.equal(NO);
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:nil]).to.equal(YES);
    });

});

SpecEnd
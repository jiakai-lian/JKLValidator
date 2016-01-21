//
//  JKLNotNilValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 21/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import "JKLNotNilValidator.h"

SpecBegin(JKLNotNilValidator)

describe(@"JKLNilValidator Tests", ^{
    
    __block id <JKLValidator> validator = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validator = [JKLNotNilValidator instance].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to verify an nil object", ^{
        expect([validator validateInput:nil error:&error]).to.equal(NO);
        expect(error).toNot.beNil;
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:nil]).to.equal(YES);
        expect(error).to.beNil;
    });
    
    it(@"should able to verify a not NSNull object(NSNull is not nil)", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:nil]).to.equal(YES);
        expect(error).to.beNil;
    });

});

SpecEnd
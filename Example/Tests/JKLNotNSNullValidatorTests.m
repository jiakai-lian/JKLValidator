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
    
    __block id <JKLValidable> validator = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validator = [JKLNotNSNullValidator instance].validator;
        
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
    
    it(@"should able to verify a not NSNull object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify a nil object (nil is not null)", ^{
        expect([validator validateInput:nil error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
});

SpecEnd

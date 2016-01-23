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
    
    __block id <JKLValidable> validable = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validable = [JKLNotNSNullValidator instance].validable;
        
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
    
    it(@"should able to verify a not NSNull object", ^{
        expect([validable validateInput:[[NSObject alloc] init]
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify a nil object (nil is not null)", ^{
        expect([validable validateInput:nil
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
});

SpecEnd

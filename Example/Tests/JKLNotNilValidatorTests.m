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
    
    __block id <JKLValidable> validable = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validable = [JKLNotNilValidator instance].validable;
        
        expect(validable).toNot.beNil();
        expect(validable).to.conformTo(@protocol(JKLValidable));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to verify an nil object", ^{
        expect([validable validateInput:nil
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validable validateInput:[[NSObject alloc] init]
                                  error:nil]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify a not NSNull object(NSNull is not nil)", ^{
        expect([validable validateInput:[[NSObject alloc] init]
                                  error:nil]).to.equal(YES);
        expect(error).to.beNil();
    });

});

SpecEnd
//
//  JKLValidatorTests.m
//  JKLValidator
//
//  Created by Jacky on 23/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <JKLValidator.h>
#import <JKLValidator+NSError.h>

SpecBegin(JKLValidator)

describe(@"JKLIsCollectionValidator Tests", ^{
    
    __block id <JKLValidable> validable = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validable = [JKLValidator instance].validable;
        
        expect(validable).toNot.beNil();
        expect(validable).to.conformTo(@protocol(JKLValidable));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to verify an NSNull object", ^{
        expect([validable validateInput:[NSNull null]
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify a nil object (nil is not null)", ^{
        expect([validable validateInput:nil
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validable validateInput:[[NSObject alloc] init]
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
});

describe(@"JKLIsCollectionValidator+NSError Tests", ^{
    
    __block JKLValidator *validator = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validator = [JKLValidator instance];
        
        expect(validator).toNot.beNil();
        expect(validator.validable).to.conformTo(@protocol(JKLValidable));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to construct a NSError object", ^{
        JKLValidatorErrorCode code = 10;
        NSDictionary * userInfo = @{};
        [validator getErrorByErrorCode:code userInfo:userInfo error:&error];
        expect(error).toNot.beNil();
        expect(error.userInfo).to.equal(userInfo);
        expect(error.code).to.equal(code);
        expect(error.domain).to.equal(JKLValidatorErrorDomain);
    });

    
});

SpecEnd

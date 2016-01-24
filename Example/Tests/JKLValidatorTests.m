//
//  JKLValidatorTests.m
//  JKLValidator
//
//  Created by Jacky on 23/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <JKLValidator.h>
#import <NSError+JKLValidator.h>

SpecBegin(JKLValidator)

describe(@"JKLValidator Tests", ^{
    
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

describe(@"NSError+JKLValidator Tests", ^{
    
    __block NSError * error = nil;
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to  construct a NSError object", ^{
        NSString * domain = @"NSErrorDomain";
        JKLValidatorErrorCode code = 10;
        NSDictionary * userInfo = @{};
        
        [NSError getErrorByErrorDomain:domain errorCode:code userInfo:userInfo error:&error];
        
        expect(error).toNot.beNil();
        expect(error.domain).to.equal(domain);
        expect(error.userInfo).to.equal(userInfo);
        expect(error.code).to.equal(code);
    });
    
});

SpecEnd

//
//  JKLNotEmptyTrimmedStringValidatorTests.m
//  JKLValidator
//
//  Created by jiakai lian on 21/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import "JKLNotEmptyTrimmedStringValidator.h"

SpecBegin(JKLNotEmptyTrimmedStringValidator)

describe(@"JKLNotEmptyTrimmedStringValidator Tests", ^{
    
    __block id <JKLValidator> validator = nil;
    
    beforeAll(^{
        validator = [JKLNotEmptyTrimmedStringValidator instance].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidator));
    });
    
    it(@"should able to verify a meaningful string", ^{
        
        expect([validator validateInput:@"string" error:nil]).to.equal(YES);
    });
    
    it(@"should able to verify an empty string", ^{
        expect([validator validateInput:@"" error:nil]).to.equal(NO);
    });
    
    
    it(@"should able to verify an string contains only spaces", ^{
        expect([validator validateInput:@"    " error:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an string contains only new line characters", ^{
        expect([validator validateInput:@"\n\n\n" error:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an string contains spaces and new line characters", ^{
        expect([validator validateInput:@" \n \n \n " error:nil]).to.equal(NO);
    });
    
    it(@"should able to verify an trimmable string", ^{
        expect([validator validateInput:@" string \n" error:nil]).to.equal(YES);
    });
    
    it(@"should able to verify a nil Object", ^{
        expect([validator validateInput:nil error:nil]).to.equal(YES);
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:nil]).to.equal(YES);
    });
    
    it(@"should able to verify a NSNull object", ^{
        expect([validator validateInput:[NSNull null] error:nil]).to.equal(YES);
    });
});

SpecEnd
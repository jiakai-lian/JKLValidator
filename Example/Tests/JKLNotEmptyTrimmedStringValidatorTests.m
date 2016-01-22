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
    
    __block id <JKLValidable> validator = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validator = [JKLNotEmptyTrimmedStringValidator instance].validator;
        
        expect(validator).toNot.beNil;
        expect(validator).to.conformTo(@protocol(JKLValidable));
    });
    
    beforeEach(^{
        error = nil;
    });
    
    it(@"should able to verify a meaningful string", ^{
        expect([validator validateInput:@"string" error:&error]).to.equal(YES);
        expect(error).to.beNil;
    });
    
    it(@"should able to verify an empty string", ^{
        expect([validator validateInput:@"" error:&error]).to.equal(NO);
        expect(error).toNot.beNil;
    });
    
    
    it(@"should able to verify an string contains only spaces", ^{
        expect([validator validateInput:@"    " error:&error]).to.equal(NO);
        expect(error).toNot.beNil;
    });
    
    it(@"should able to verify an string contains only new line characters", ^{
        expect([validator validateInput:@"\n\n\n" error:&error]).to.equal(NO);
        expect(error).toNot.beNil;
    });
    
    it(@"should able to verify an string contains spaces and new line characters", ^{
        expect([validator validateInput:@" \n \n \n " error:&error]).to.equal(NO);
        expect(error).toNot.beNil;
    });
    
    it(@"should able to verify an trimmable string", ^{
        expect([validator validateInput:@" string \n" error:&error]).to.equal(YES);
        expect(error).to.beNil;
    });
    
    it(@"should able to verify a nil Object", ^{
        expect([validator validateInput:nil error:&error]).to.equal(YES);
        expect(error).to.beNil;
    });
    
    it(@"should able to verify a not nil object", ^{
        expect([validator validateInput:[[NSObject alloc] init] error:&error]).to.equal(YES);
        expect(error).to.beNil;
    });
    
    it(@"should able to verify a NSNull object", ^{
        expect([validator validateInput:[NSNull null] error:&error]).to.equal(YES);
        expect(error).to.beNil;
    });
});

SpecEnd
//
//  JKLStringRegularExpressionValidatorTests.m
//  JKLValidator
//
//  Created by Jacky on 24/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <JKLStringRegularExpressionValidator.h>


SpecBegin(JKLStringRegularExpressionValidator)

describe(@"JKLStringRegularExpressionValidator Tests", ^{
    
    __block id <JKLValidable> validable = nil;
    __block NSError * error = nil;
    
    beforeAll(^{
        validable = [JKLStringRegularExpressionValidator instanceWithRegularExpression:
                [NSRegularExpression regularExpressionWithPattern:@"\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,6}" options:NSRegularExpressionCaseInsensitive error:nil]].validable;
        
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
    
    it(@"should able to verify an arbitrary object", ^{
        expect([validable validateInput:[[NSObject alloc] init]
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });
    
    it(@"should able to verify a nil", ^{
        expect([validable validateInput:nil
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });

    it(@"should able to verify an empty String", ^{
        expect([validable validateInput:@""
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });

    it(@"should able to verify an invalid string", ^{
        expect([validable validateInput:@"jiakai.lian"
                                  error:&error]).to.equal(NO);
        expect(error).toNot.beNil();
    });

    it(@"should able to verify a valid string", ^{
        expect([validable validateInput:@"xxxx.yyyy@zzzz.com"
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });

    it(@"should able to verify multi valid string", ^{
        expect([validable validateInput:@"xxxx.yyyy@zzzz.com x.yy@zzz.com"
                                  error:&error]).to.equal(YES);
        expect(error).to.beNil();
    });
    
});

SpecEnd

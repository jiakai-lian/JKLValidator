//
//  JKLValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import <JKLValidator/JKLValidator.h>
#import "JKLValidator.h"

@interface JKLValidator()<JKLValidable>

@end

@implementation JKLValidator

+ (instancetype)instance
{
    return [[self alloc]init];
}

//- (BOOL)validateWithError:(NSError **)error {
//    return YES;
//}

- (BOOL)validateInput:(id)input error:(NSError * __autoreleasing *)outError
{
    return YES;
}

- (BOOL)andValidateByValidators:(NSArray<id <JKLValidable>> *)validators
                          input:(id)input
                          error:(NSError * __autoreleasing *)outError
{
    BOOL valid = YES;

    if(validators)
    {
        for(id<JKLValidable> validator in validators)
        {
            valid = valid && [validator validateInput:input
                                                error:outError];
            if(!valid)
            {
                break;
            }
        }
    }

    return valid;
}

- (BOOL)orValidateByValidators:(NSArray<id <JKLValidable>> *)validators
                         input:(id)input
                         error:(NSError * __autoreleasing *)outError
{
    BOOL valid = NO;

    if(validators)
    {
        for(id<JKLValidable> validator in validators)
        {
            valid = valid || [validator validateInput:input
                                                error:outError];
            if(valid)
            {
                break;
            }
        }
    }

    return valid;
}


- (id <JKLValidable>)validator {
    return self;
}


@end

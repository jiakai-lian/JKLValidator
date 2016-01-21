//
//  JKLRequiredValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import "JKLRequiredValidator.h"

#import "JKLNotEmptyTrimmedStringValidator.h"
#import "JKLNotEmptyCollectionValidator.h"
#import "JKLNotNilValidator.h"
#import "JKLNotNSNullValidator.h"

@interface JKLRequiredValidator ()

@property (nonatomic, strong) NSArray<id<JKLValidator>> * subValidators;

@end

@implementation JKLRequiredValidator

- (instancetype)init{
    self = [super init];
    if(self)
    {
        _subValidators = @[[JKLNotEmptyTrimmedStringValidator instance].validator,[JKLNotEmptyCollectionValidator instance].validator,[JKLNotNilValidator instance].validator,[JKLNotNSNullValidator instance].validator];
    }
    
    return self;
}

#pragma mark - JKLValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = NO;
    
    for(id<JKLValidator> subValidator in self.subValidators)
    {
        valid = [subValidator validateInput:input error:outError];
        
        if(!valid)
        {
            break;
        }
    }

    return valid;
}

@end

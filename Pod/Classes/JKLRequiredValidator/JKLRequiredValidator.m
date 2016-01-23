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

@property (nonatomic, strong) NSArray<id<JKLValidable>> * subValidators;

@end

@implementation JKLRequiredValidator

- (instancetype)init{
    self = [super init];
    if(self)
    {
//        _subValidators = @[[JKLNotEmptyTrimmedStringValidator instance].validator,[JKLNotEmptyCollectionValidator instance].validator,[JKLNotNilValidator instance].validator,[JKLNotNSNullValidator instance].validator];
    }
    
    return self;
}

#pragma mark - JKLValidator

- (BOOL)validateInput:(id)input
                error:(NSError *__autoreleasing *)outError {
    BOOL valid = YES;
    
//    for(id<JKLValidable> subValidator in self.subValidators)
//    {
//        valid = valid && [subValidator validateInput:input error:outError];
//        
//        if(!valid)
//        {
//            break;
//        }
//    }

    return valid;
}

- (NSArray *)subValidators {
    if (!_subValidators) {
        _subValidators = @[[JKLNotEmptyTrimmedStringValidator instance].validator,[JKLNotEmptyCollectionValidator instance].validator,[JKLNotNilValidator instance].validator,[JKLNotNSNullValidator instance].validator];
    }
    return _subValidators;
}

@end

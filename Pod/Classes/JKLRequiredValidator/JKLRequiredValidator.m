//
//  JKLRequiredValidator.m
//  Pods
//
//  Created by jiakai lian on 19/01/2016.
//
//

#import "JKLRequiredValidator.h"

@implementation JKLRequiredValidator

- (instancetype)initWithInput:(NSObject *)input
{
    self = [super init];
    if(self)
    {
        _input = [input copy];
    }
    return self;
}

#pragma mark - JKLValidator
//override
- (BOOL) validateWithError:(NSError *)error
{
    if([self.input isKindOfClass:[NSString class]])
    {
        return [((NSString *)self.input) stringByTrimmingCharactersInSet:
                                         [NSCharacterSet whitespaceCharacterSet]].length;
    }
    else if([self.input respondsToSelector:@selector(count)])
    {
        return [self.input count];
    }
    
    return self.input;
}

@end

//
// Created by Jacky on 23/01/2016.
//

#import "JKLValidator.h"


@interface JKLStringRegularExpressionValidator : JKLValidator

@property(nonatomic, copy) NSRegularExpression *regex;

- (instancetype)initWithRegularExpression:(NSRegularExpression *)regex;
+ (instancetype)instanceWithRegularExpression:(NSRegularExpression *)regex;

@end
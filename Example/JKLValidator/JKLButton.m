//
//  JKLButton.m
//  JKLValidator
//
//  Created by Jacky on 24/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import "JKLButton.h"

@interface JKLButton()
@property(nonatomic, copy, readwrite) UIColor *jkl_backgroundColorWhenEnable;

@end

@implementation JKLButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setup];
    }

    return self;
}

- (void)setup
{
    self.jkl_backgroundColorWhenEnable = [self.backgroundColor copy];
    self.jkl_backgroundColorWhenDisable = [UIColor lightGrayColor];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    self.jkl_backgroundColorWhenEnable = backgroundColor;
}

- (void)jkl_enabled:(BOOL)enabled
{
    self.enabled = enabled;
    self.backgroundColor = enabled?self.jkl_backgroundColorWhenEnable:self.jkl_backgroundColorWhenDisable;
    
}




@end

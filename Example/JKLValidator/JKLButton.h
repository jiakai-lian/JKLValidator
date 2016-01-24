//
//  JKLButton.h
//  JKLValidator
//
//  Created by Jacky on 24/01/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKLButton : UIButton

@property(nonatomic, copy, readonly) UIColor *jkl_backgroundColorWhenEnable;
@property(nonatomic, copy) UIColor *jkl_backgroundColorWhenDisable;

- (void)jkl_enabled:(BOOL)enabled;
@end

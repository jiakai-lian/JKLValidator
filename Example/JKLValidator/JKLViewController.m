//
//  JKLViewController.m
//  JKLValidator
//
//  Created by jiakai lian on 01/19/2016.
//  Copyright (c) 2016 jiakai lian. All rights reserved.
//

#import "JKLViewController.h"

#import "JKLButton.h"
#import "JKLValidator.h"
#import "JKLStringRegularExpressionValidator.h"
#import "JKLNotEmptyTrimmedStringValidator.h"
#import "NSArray+JKLValidator.h"
#import "JKLSignUpValidator.h"

@interface JKLViewController ()
@property(weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property(weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@property(weak, nonatomic) IBOutlet JKLButton *buttonSignUp;

@property(nonatomic, copy) NSArray<id <JKLValidable>> *emailValidators;
@property(nonatomic, copy) NSArray<id <JKLValidable>> *passwordValidators;
@property(nonatomic, copy) id <JKLValidable>          signUpValidator;

@end

@implementation JKLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.buttonSignUp jkl_enabled:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event handling

- (IBAction)emailTextFieldDidEndEditing:(UITextField *)sender {
    [self updateTextField:sender
             ByValidators:self.emailValidators];

    [self updateUIByValidation:[self.signUpValidator validateInput:@[self.textFieldEmail.text, self.textFieldPassword.text]
                                                             error:nil]];
}

- (IBAction)passwordTextFieldDidEndEditing:(UITextField *)sender {
    [self updateTextField:sender
             ByValidators:self.passwordValidators];

    [self updateUIByValidation:[self.signUpValidator validateInput:@[self.textFieldEmail.text, self.textFieldPassword.text]
                                                             error:nil]];
}

- (IBAction)tapSignUpButton:(id)sender {
}

#pragma mark - private methods

- (void)updateTextField:(UITextField *)textField
           ByValidators:(NSArray *)validators {
    NSError *error = nil;
    BOOL    valid  = [validators andValidateInput:textField.text
                                            error:&error];
    if (valid || !textField.text.length) {
        textField.backgroundColor = [UIColor whiteColor];
    }
    else {
        textField.backgroundColor = [UIColor redColor];
    }
}

- (void)updateUIByValidation:(BOOL)valid {
    [self.buttonSignUp jkl_enabled:valid];
}

#pragma mark - private properties

- (NSArray *)emailValidators {
    if (!_emailValidators) {
        _emailValidators = @[[JKLNotEmptyTrimmedStringValidator instance].validable, [JKLStringRegularExpressionValidator instanceWithRegularExpression:
                [NSRegularExpression regularExpressionWithPattern:@"[a-z0-9_]+@[a-z0-9_]+?\\.[a-z0-9]{2,6}"
                                                          options:NSRegularExpressionCaseInsensitive
                                                            error:nil]].validable
        ];
    }
    return _emailValidators;
}

- (NSArray *)passwordValidators {
    if (!_passwordValidators) {
        _passwordValidators = @[[JKLNotEmptyTrimmedStringValidator instance].validable, [JKLStringRegularExpressionValidator instanceWithRegularExpression:
                [NSRegularExpression regularExpressionWithPattern:@"^\\S{8,64}$"
                                                          options:NSRegularExpressionCaseInsensitive
                                                            error:nil]].validable];
    }
    return _passwordValidators;
}

- (id <JKLValidable>)signUpValidator {
    if (!_signUpValidator) {
        _signUpValidator = [JKLSignUpValidator instanceWithEmailValidators:self.emailValidators
                                                        passwordValidators:self.passwordValidators].validable;
    }
    return _signUpValidator;
}


@end

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

@interface JKLViewController ()
@property(weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property(weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@property(weak, nonatomic) IBOutlet JKLButton *buttonSignUp;

@property(nonatomic, strong) NSArray<id <JKLValidable>> *emailValidators;
@property(nonatomic, strong) NSArray<id <JKLValidable>> *passwordValidators;

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
    
    [self updateUIByValidation:[self.emailValidators andValidateInput:self.textFieldEmail.text error:nil] && [self.passwordValidators andValidateInput:self.textFieldPassword.text error:nil]];
}

- (IBAction)passwordTextFieldDidEndEditing:(UITextField *)sender {
    [self updateTextField:sender
             ByValidators:self.passwordValidators];
    
    [self updateUIByValidation:[self.emailValidators andValidateInput:self.textFieldEmail.text error:nil] && [self.passwordValidators andValidateInput:self.textFieldPassword.text error:nil]];
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

- (void)updateUIByValidation:(BOOL)valid
{
    [self.buttonSignUp jkl_enabled:valid];
}

#pragma mark - private properties

- (NSArray *)emailValidators {
    if (!_emailValidators) {
        _emailValidators = @[[JKLNotEmptyTrimmedStringValidator instance].validable, [JKLStringRegularExpressionValidator instanceWithRegularExpression:
                [NSRegularExpression regularExpressionWithPattern:@"\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,6}"
                                                          options:NSRegularExpressionCaseInsensitive
                                                            error:nil]].validable
        ];
    }
    return _emailValidators;
}

- (NSArray *)passwordValidators {
    if (!_passwordValidators) {
        _passwordValidators = @[[JKLNotEmptyTrimmedStringValidator instance].validable];
    }
    return _passwordValidators;
}


@end

//
//  VerificationController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/26/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "VerificationController.h"

@interface VerificationController ()
@property (weak, nonatomic) IBOutlet UITextField *firstField;
@property (weak, nonatomic) IBOutlet UITextField *secodField;
@property (weak, nonatomic) IBOutlet UITextField *thirdField;
@property (weak, nonatomic) IBOutlet UITextField *fourthField;

@end

@implementation VerificationController

    - (IBAction)clearButton:(id)sender {
        [_firstField setText:NULL];
        [_secodField setText:NULL];
        [_thirdField setText:NULL];
        [_fourthField setText:NULL];
    }

    - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
        
        if(range.length + range.location > textField.text.length) {
            return NO;
        }
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        
        [_firstField addTarget:self action:@selector(changeFirstResponder) forControlEvents:UIControlEventEditingChanged];
        [_firstField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
        
        [_secodField addTarget:self action:@selector(changeFirstResponder) forControlEvents:UIControlEventEditingChanged];
        [_secodField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
        
        [_thirdField addTarget:self action:@selector(changeFirstResponder) forControlEvents:UIControlEventEditingChanged];
        [_thirdField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
        
        [_fourthField addTarget:self action:@selector(changeFirstResponder) forControlEvents:UIControlEventEditingChanged];
        [_fourthField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
        
        return newLength <= 1;
    }

    - (void)clearField:(UITextField *)textField {
        [textField setText:NULL];
    }

    - (void)changeFirstResponder {
        if(_firstField.isFirstResponder) {
            [_firstField resignFirstResponder];
            [_secodField becomeFirstResponder];
        } else if(_secodField.isFirstResponder) {
            [_secodField resignFirstResponder];
            [_thirdField becomeFirstResponder];
        } else if(_thirdField.isFirstResponder) {
            [_thirdField resignFirstResponder];
            [_fourthField becomeFirstResponder];
        } else if(_fourthField.isFirstResponder) {
            [_fourthField resignFirstResponder];
            [self.view endEditing:YES];
        }
    }

    - (void)textFieldDidEndEditing:(UITextField *)textField {
    
        if(_firstField.isFirstResponder && _firstField.text.length != 0) {
            [_firstField resignFirstResponder];
            [_secodField becomeFirstResponder];
        } else if(_secodField.isFirstResponder && _secodField.text.length != 0) {
            [_secodField resignFirstResponder];
            [_thirdField becomeFirstResponder];
        } else if(_thirdField.isFirstResponder && _thirdField.text.length != 0) {
            [_thirdField resignFirstResponder];
            [_fourthField becomeFirstResponder];
        } else if(_fourthField.isFirstResponder && _fourthField.text.length != 0) {
            [_fourthField resignFirstResponder];
            [self.view endEditing:YES];
        }
        
    }

    - (void)loadView {
        [super loadView];

    }

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

@end

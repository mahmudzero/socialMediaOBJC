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
        
        switch(textField.tag) {
            case 0:
                [self handleFirstTextFieldEvent];
                break;
            case 1:
                [self handleSecondTextFieldEvent];
                break;
            case 2:
                [self handleThirdTextFieldEvent];
                break;
            case 3:
                [self handleFourthTextFieldEvent];
                break;
            default:
                break;
        }
        
        return newLength <= 1;
    }

    - (void)handleFirstTextFieldEvent {
        [_firstField addTarget:self action:@selector(changeFirstResponderOneToTwo) forControlEvents:UIControlEventEditingChanged];
        [_firstField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
    }

    - (void)handleSecondTextFieldEvent {
        [_secodField addTarget:self action:@selector(changeFirstResponderTwoToThree) forControlEvents:UIControlEventEditingChanged];
        [_secodField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
    }

    - (void)handleThirdTextFieldEvent {
        [_thirdField addTarget:self action:@selector(changeFirstResponderThreeToFour) forControlEvents:UIControlEventEditingChanged];
        [_thirdField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
    }

    - (void)handleFourthTextFieldEvent {
        [_fourthField addTarget:self action:@selector(changeFirstResponderFour) forControlEvents:UIControlEventEditingChanged];
        [_fourthField addTarget:self action:@selector(clearField:) forControlEvents:UIControlEventEditingDidBegin];
    }

    - (void)clearField:(UITextField *)textField {
        [textField setText:NULL];
    }

    - (void)changeFirstResponder:(UITextField *)responderOne toResponder:(UITextField *)responderTwo {
        [responderOne resignFirstResponder];
        [responderTwo becomeFirstResponder];
    }

    - (void)changeFirstResponderOneToTwo {
        [self changeFirstResponder:_firstField toResponder:_secodField];
    }
    - (void)changeFirstResponderTwoToThree {
        [self changeFirstResponder:_secodField toResponder:_thirdField];
    }
    - (void)changeFirstResponderThreeToFour {
        [self changeFirstResponder:_thirdField toResponder:_fourthField];
    }
    - (void)changeFirstResponderFour {
        [_fourthField resignFirstResponder];
        [self.view endEditing:YES];
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

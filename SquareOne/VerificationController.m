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

    - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
        
        if(range.length + range.location > textField.text.length) {
            return NO;
        }
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        
        if(_firstField.isFirstResponder || _firstField.text.length != 0) {
            [_secodField becomeFirstResponder];
            return newLength <= 1;
        } else if (_secodField.isFirstResponder & (_secodField.text.length != 0)) {
            [_thirdField becomeFirstResponder];
            return newLength <= 1;
        } else if (_thirdField.isFirstResponder & (_thirdField.text.length !=0)) {
            [_fourthField becomeFirstResponder];
            return newLength <= 1;
        } else if (_fourthField.isFirstResponder & (_fourthField.text.length !=0)) {
            [self.view endEditing:YES];
            return newLength <= 1;
        }
        
        
        return newLength <= 1;
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

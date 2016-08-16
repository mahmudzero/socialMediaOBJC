//
//  VerificationController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/26/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "VerificationController.h"
#import <AWSLambda/AWSLambda.h>
#import <AWSCore/AWSCore.h>

@interface VerificationController ()
@property (weak, nonatomic) IBOutlet UITextField *firstField;
@property (weak, nonatomic) IBOutlet UITextField *secodField;
@property (weak, nonatomic) IBOutlet UITextField *thirdField;
@property (weak, nonatomic) IBOutlet UITextField *fourthField;
@property (weak, nonatomic) IBOutlet UIView *superView;
@property (weak, nonatomic) IBOutlet UIButton *verifyButton;

@end

@implementation VerificationController {
    UIAlertController *alerted;
    UIAlertAction *actioned;
    NSNumber *successStatused;
}

    - (IBAction)clearButton:(id)sender {
        [_firstField setText:NULL];
        [_secodField setText:NULL];
        [_thirdField setText:NULL];
        [_fourthField setText:NULL];
    }
    - (IBAction)verifyPin:(id)sender {
        //NSDictionary *parameters;
        [self performSegueWithIdentifier:@"goToTabbedController" sender:_verifyButton];
        //[self callLamda:parameters withMethodName:@"methodName"];
    }

    - (IBAction)resendVerificationPin:(id)sender {
        //[self callLambda:nil withMethodName:@"methodName"];
        alerted = [UIAlertController alertControllerWithTitle:@"Request sent" message:@"A new pin was sent to your email" preferredStyle:UIAlertControllerStyleAlert];
        actioned = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
        [alerted addAction:actioned];
        [self presentViewController:alerted animated:YES completion:nil];
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

    - (void)callLamda:(NSDictionary *)dictionary withMethodName:(NSString *)lamdaFunction {
        successStatused = [NSNumber numberWithInt:200];
        AWSLambdaInvoker *invoker = [AWSLambdaInvoker defaultLambdaInvoker];
        [[invoker invokeFunction:lamdaFunction JSONObject:dictionary] continueWithBlock:^id(AWSTask *task) {
            if(task.error) {
                NSLog(@"Error: %@", task.error);
            }
            if(task.exception) {
                NSLog(@"Exception: %@", task.exception);
            }
            if(task.result) {
                NSNumber *statusCode = [task.result objectForKey:@"status"];
                if([statusCode intValue] != [successStatused intValue]) {
                    NSLog(@"not successful");
                    alerted = [UIAlertController alertControllerWithTitle:@"Error" message:@"These was an error when verifying" preferredStyle:UIAlertControllerStyleAlert];
                    actioned = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
                    [alerted addAction:actioned];
                    dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alerted animated:YES completion:nil];});
                } else {
                    NSLog(@"%s", "SUCESSES");
                    dispatch_async(dispatch_get_main_queue(), ^{[self performSegueWithIdentifier:@"goToTabbedController" sender:_verifyButton];});
                }
            }
            return nil;
        }];
        
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

    - (void)setSuperVieWGestureRecognizers {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
        [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
        [_superView addGestureRecognizer:swipeDown];
        [_superView addGestureRecognizer:tap];
    }

    - (void)loadView {
        [super loadView];
    }

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
        [self setSuperVieWGestureRecognizers];
        [self setNeedsStatusBarAppearanceUpdate];
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    - (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
    }

@end

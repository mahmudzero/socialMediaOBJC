//
//  RegistrationController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 7/28/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "RegistrationController.h"
#import <AWSLambda/AWSLambda.h>
#import <AWSCore/AWSCore.h>

#define keyboard_offset 80.0
static __weak id currentFirstResponder;

@interface RegistrationController ()

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassowrd;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIView *superView;


@end

@implementation RegistrationController {
    NSNumber *successStatus;
    UIAlertController *alert;
    UIAlertAction *action;
}

    - (IBAction)register:(id)sender {
        NSDictionary *parameters = @{@"email": _email.text, @"password": _password.text};
        if([self checkInupts]) {
            [self callLamda:parameters withMethodName:@"registration-part-one"];
        }
    }

    - (BOOL)checkInupts {
        NSString *emailRegex = @"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z0-9.-]?+.edu";
        NSString *passwordRegex = @"[^<>{}()\\[\\]\\s]{6,}";
        NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        NSPredicate *passswordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
        if([emailPredicate evaluateWithObject:_email.text] && [passswordPredicate evaluateWithObject:_password.text] && [_password.text isEqualToString:_confirmPassowrd.text]) {
            return YES;
        } else {
            alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Password or email do not match required format" preferredStyle:UIAlertControllerStyleAlert];
            action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            return NO;
        }
    }

    - (void)callLamda:(NSDictionary *)dictionary withMethodName:(NSString *)lamdaFunction {
        successStatus = [NSNumber numberWithInt:200];
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
                if([statusCode intValue] != [successStatus intValue]) {
                    NSLog(@"not successful");
                    alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"These was an error when trying to register" preferredStyle:UIAlertControllerStyleAlert];
                    action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
                    [alert addAction:action];
                    dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
                } else {
                    NSLog(@"%s", "SUCESSES");
                    dispatch_async(dispatch_get_main_queue(), ^{[self performSegueWithIdentifier:@"verify" sender:_registerButton];});
                }
            }
            return nil;
        }];
        
    }

    - (BOOL)textFieldShouldReturn:(UITextField *)textField {
        switch(textField.tag) {
            case 0:
                [self changeFirstResponderFirstNameToLastName];
                break;
            case 1:
                [self changeFirstResponderLastNameToEmail];
                break;
            case 2:
                [self changeFirstResponderEmailToPassword];
                break;
            case 3:
                [self changeFirstResponderPasswordToConfirmPassword];
                break;
            case 4:
                [self confirmRegistrationOnReturn];
                break;
            default:
                break;
        }
        return NO;
    }

    - (void)setNewRectWithAnimation:(CGRect *)rect withDuration:(double)timeInterval {
        NSTimeInterval *nsInterval = &timeInterval;
        [UIView beginAnimations:nil context:NULL];
        self.view.frame = *(rect);
        [UIView setAnimationDuration:*nsInterval];
        [UIView commitAnimations];
    }

    - (void)textFieldDidBeginEditing:(UITextField *)textField {
        CGRect rect = self.view.frame;
        if([textField isEqual:_email] || [textField isEqual:_password] || [textField isEqual:_confirmPassowrd]) {
            if(self.view.frame.origin.y >= 0) {
                rect.origin.y -= 175;
                [self setNewRectWithAnimation:&rect withDuration:5.0];
            }
        }
        if([textField isEqual:_firstNameField] || [textField isEqual:_lastNameField]) {
            if(self.view.frame.origin.y < 0) {
                rect.origin.y += 175;
                [self setNewRectWithAnimation:&rect withDuration:5.0];
            }
        }
    }

    - (void)textFieldDidEndEditing:(UITextField *)textField {
        CGRect rect = self.view.frame;
        if(self.view.frame.origin.y < 0) {
            rect.origin.y += 175;
            [self setNewRectWithAnimation:&rect withDuration:5.0];
        }
    }


    - (void)changeFirstResponder:(UITextField *)responderOne toResponder:(UITextField *)responderTwo {
        [responderOne resignFirstResponder];
        [responderTwo becomeFirstResponder];
    }
    - (void)changeFirstResponderFirstNameToLastName {
        [self changeFirstResponder:_firstNameField toResponder:_lastNameField];
    }
    - (void)changeFirstResponderLastNameToEmail {
        [self changeFirstResponder:_lastNameField toResponder:_email];
    }
    - (void)changeFirstResponderEmailToPassword {
        [self changeFirstResponder:_email toResponder:_password];
    }
    - (void)changeFirstResponderPasswordToConfirmPassword {
        [self changeFirstResponder:_password toResponder:_confirmPassowrd];
    }
    - (void)confirmRegistrationOnReturn {
        [_confirmPassowrd resignFirstResponder];
        [self.view endEditing:YES];
        [self register:_registerButton];
    }

    - (void)dismissKeyboard {
        [self.view endEditing:YES];
    }

    - (void)setSuperVieWGestureRecognizers {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
        [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
        [_superView addGestureRecognizer:swipeDown];
        [_superView addGestureRecognizer:tap];
    }


    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        [self setSuperVieWGestureRecognizers];
    }

    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  LoginController.m
//  SquareOne
//
//  Created by Mahmud Assamaray on 8/9/16.
//  Copyright © 2016 Mahmud Assamaray. All rights reserved.
//

#import "LoginController.h"
#import <AWSLambda/AWSLambda.h>
#import <AWSCore/AWSCore.h>


@interface LoginController ()

@end

@implementation LoginController {
    NSNumber *successStatus;
    UIAlertController *alert;
    UIAlertAction *action;
}

    - (IBAction)login:(id)sender {
        //[self performSegueWithIdentifier:@"goToTabbedController" sender:sender];
    }

    - (IBAction)forgotPassword:(id)sender {
        //[self performSegueWithIdentifier:@"recoverPassword" sender:sender];
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
                    dispatch_async(dispatch_get_main_queue(), ^{[self performSegueWithIdentifier:@"verify" sender:nil];});
                }
            }
            return nil;
        }];
        
    }

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
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

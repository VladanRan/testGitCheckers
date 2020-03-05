//
//  ViewController.m
//  OClintExampleApp
//
//  Created by Vladan Randjelovic on 03/03/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernamTF;
@synthesize passwordTF;
NSString *username;
NSString *password;
NSString *usernameMsg = @"Username cant be empty and must contain at least 4 characters!";
NSString *passMsg =@"Password cant be empty and must contain at least 4 characters!";

- (void)viewDidLoad {
    [super viewDidLoad];
    usernamTF.delegate = self;
             passwordTF.delegate = self;
    // Do any additional setup after loading the view.
}


- (IBAction)login:(id)sender {
    if ([self validateUsername:username andPassword:password]) {
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainController =
    [storyBoard instantiateViewControllerWithIdentifier:@"mainScreen"];
    [self presentViewController:mainController animated:YES completion:nil];
    }
}
    
- (IBAction)loginPassword:(id)sender argument:(NSString *)arg {
    password = self.passwordTF.text;
}

- (IBAction)loginUsername:(id)sender {
    username = usernamTF.text;
}

-(BOOL)validateUsername:(NSString *)username andPassword:(NSString *) password {
    if([username isEqual:NULL] || ([username length] < 4)) {
        [self showSimpleCriticalAlert:usernameMsg];
        return NO;
    } else if([password isEqual:NULL] || ([password length] < 4)) {
        [self showSimpleCriticalAlert:passMsg];
        return NO;
    }
        return YES;
    
}

-(void)showSimpleCriticalAlert:(NSString *) message {
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setTitle:@"Alert"];
    [alert setMessage:message];
    [alert show];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end

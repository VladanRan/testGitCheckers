//
//  ViewController.h
//  OClintExampleApp
//
//  Created by Vladan Randjelovic on 03/03/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIAlertViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernamTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

- (IBAction)login:(id)sender;
- (IBAction)loginPassword:(id)sender argument:(NSString *)arg;
- (IBAction)loginUsername:(id)sender;

@end


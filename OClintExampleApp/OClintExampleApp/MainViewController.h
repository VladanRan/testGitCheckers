//
//  MainViewController.h
//  OClintExampleApp
//
//  Created by Vladan Randjelovic on 03/03/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *enterLinkTF;


- (IBAction)download:(id)sender;


@end

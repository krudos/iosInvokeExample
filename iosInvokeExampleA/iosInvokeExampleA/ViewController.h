//
//  ViewController.h
//  iosInvokeExampleA
//
//  Created by krudos on 6/12/16.
//  Copyright © 2016 krudos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)invocarB_Button:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tfMonto;




- (void)called:(UIApplication *)application openURL:(NSURL *)url
sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@property (weak, nonatomic) IBOutlet UILabel *labelResultado;


@end


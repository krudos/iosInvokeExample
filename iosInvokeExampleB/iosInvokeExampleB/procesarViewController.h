//
//  procesarViewController.h
//  iosInvokeExampleB
//
//  Created by krudos on 6/13/16.
//  Copyright © 2016 krudos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface procesarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelArgumentos;
- (IBAction)finalizarButton:(id)sender;

@property NSURL* url;
@property NSString*  sourceApplication;
@property (weak, nonatomic) IBOutlet UISwitch *switchResultado;

@end

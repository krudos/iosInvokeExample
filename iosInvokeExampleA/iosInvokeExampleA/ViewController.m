//
//  ViewController.m
//  iosInvokeExampleA
//
//  Created by krudos on 6/12/16.
//  Copyright © 2016 krudos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)invocarB_Button:(id)sender {

    NSString *customURL = @"procesarPago://";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:customURL]])
    {
        NSMutableArray* argument = [[NSMutableArray alloc] init];
        [argument addObject:[NSString stringWithFormat:@"monto=%@",self.tfMonto.text]];
        
        [argument addObject:@"tipo=1"];
       
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",customURL,[argument componentsJoinedByString:@","]]]];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL error"
                                                        message:[NSString stringWithFormat:
                                                                 @"No custom URL defined for %@", customURL]
                                                       delegate:self cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }

}
@end

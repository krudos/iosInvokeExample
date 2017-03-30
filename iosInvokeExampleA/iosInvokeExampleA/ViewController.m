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
       
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",customURL,[argument componentsJoinedByString:@"&"]]]];
    }
    else
    {
        
       
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"URL error"
                                     message:[NSString stringWithFormat:
                                              @"No custom URL defined for %@", customURL]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                    }];
        
  
        
        [alert addAction:yesButton];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }

}




- (void)called:(UIApplication *)application openURL:(NSURL *)url
sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    
    
    NSDictionary* q = [self parseQueryString:url.query];//
    
    self.labelResultado.text = [NSString stringWithFormat:@"monto:%@\nresultado:%@",[q valueForKey:@"monto"],[q valueForKey:@"resultado"]];
    
    
}



- (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    NSCharacterSet *set = [NSCharacterSet URLHostAllowedCharacterSet];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByAddingPercentEncodingWithAllowedCharacters:set];
        NSString *val = [[elements objectAtIndex:1] stringByAddingPercentEncodingWithAllowedCharacters:set];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}



@end

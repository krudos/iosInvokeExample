//
//  procesarViewController.m
//  iosInvokeExampleB
//
//  Created by krudos on 6/13/16.
//  Copyright © 2016 krudos. All rights reserved.
//

#import "procesarViewController.h"

@interface procesarViewController ()

@end

@implementation procesarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    

    NSDictionary* q = [self parseQueryString:self.url.query];//    NSString * scheme = [self.url scheme];
//    NSArray* arguments = [[self.url query] componentsSeparatedByString:@"&"];
    
    
    
    self.labelArgumentos.text = [q valueForKey:@"monto"];
    
    NSLog(@"Calling Application Bundle ID: %@", self.sourceApplication);
    NSLog(@"URL scheme:%@", [self.url scheme]);
    NSLog(@"URL query: %@", [self.url query]);
    
    NSLog(@"");
    
  
    
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


- (IBAction)finalizarButton:(id)sender {
    
    
    
    NSDictionary* q = [self parseQueryString:self.url.query];
    
    NSString* monto = [q valueForKey:@"monto"];
    
    double monto2 = [monto doubleValue]  ;
    
    NSString *customURL = @"completoPago://";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:customURL]])
    {
        NSMutableArray* argument = [[NSMutableArray alloc] init];
        [argument addObject:[NSString stringWithFormat:@"monto=%.2f",monto2]];
        
        [argument addObject:[NSString stringWithFormat:@"resultado=%@",self.switchResultado.isOn?@"true":@"false"]];
        
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
@end

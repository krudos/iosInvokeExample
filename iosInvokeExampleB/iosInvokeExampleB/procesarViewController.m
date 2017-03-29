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
    
    
    
    
    NSString * scheme = [self.url scheme];
    NSArray* arguments = [[self.url query] componentsSeparatedByString:@","];
    
    
    
    NSLog(@"Calling Application Bundle ID: %@", self.sourceApplication);
    NSLog(@"URL scheme:%@", [self.url scheme]);
    NSLog(@"URL query: %@", [self.url query]);
    
  
    
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

- (IBAction)finalizarButton:(id)sender {
}
@end

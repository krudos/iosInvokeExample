//
//  ViewController.m
//  iosInvokeExampleB
//
//  Created by krudos on 6/12/16.
//  Copyright © 2016 krudos. All rights reserved.
//

#import "ViewController.h"
#import "procesarViewController.h"

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



- (void)called:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    
    procesarViewController *vista = (procesarViewController*)[[procesarViewController alloc] initWithNibName:@"procesarViewController" bundle:nil];
    
    vista.url = url;
    vista.sourceApplication = sourceApplication;
    
    [self presentViewController:vista animated:YES completion:nil];
    
    

}

@end

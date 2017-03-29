//
//  ViewController.h
//  iosInvokeExampleB
//
//  Created by krudos on 6/12/16.
//  Copyright © 2016 krudos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController




- (void)called:(UIApplication *)application openURL:(NSURL *)url
sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;


@end


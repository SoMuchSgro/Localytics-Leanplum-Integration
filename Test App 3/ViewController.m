//
//  ViewController.m
//  Test App 3
//
//  Created by Sgro on 11/12/14.
//  Copyright (c) 2014 Richard Sgro. All rights reserved.
//

#import "ViewController.h"
#import <Leanplum/Leanplum.h>
#import "LocalyticsSession.h"
DEFINE_VAR_STRING(welcomeMessage, @"Welcome to Leanplum!");

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [Leanplum onVariablesChanged:^{
        NSLog(@"%@", welcomeMessage.stringValue);
    }];

    [self addAlertView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addAlertView{
UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                              @"Title" message: welcomeMessage.stringValue delegate:self
                                             cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];

    [alertView show];
}

@end

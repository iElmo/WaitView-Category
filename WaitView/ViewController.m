//
//  ViewController.m
//  WaitView
//
//  Created by Dan Mac Hale on 13/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+WaitView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showWaitView];
    [self performSelector:@selector(hideWaitView) withObject:nil afterDelay:4];
}

-(void)hideWaitView {
    [super hideWaitView];
}

@end

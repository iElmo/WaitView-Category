//
//  UIViewController+WaitView.m
//  WaitView
//
//  Created by Dan Mac Hale on 13/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "UIViewController+WaitView.h"

#define CONTAINERVIEWTAG 999
@implementation UIViewController (WaitView)

-(void)createWaitView {
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    
    UIView *containerView = [[UIView alloc] initWithFrame:mainWindow.frame];
    [containerView setBackgroundColor:[UIColor whiteColor]];
    containerView.tag = CONTAINERVIEWTAG;
    
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    loadingLabel.text = @"Loading..";
    loadingLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    loadingLabel.center = containerView.center;
    [containerView addSubview:loadingLabel];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [spinner setHidesWhenStopped:YES];
    [spinner startAnimating];
    [containerView addSubview:spinner];
    spinner.frame = CGRectMake(loadingLabel.frame.origin.x - spinner.frame.size.width, loadingLabel.frame.origin.y, spinner.frame.size.width, spinner.frame.size.height);
    
    [containerView setAlpha:0.1];
    __weak UIViewController *blockSelf = self;
    [UIView animateWithDuration:0.9 animations:^{
        [containerView setAlpha:1.0];
        [blockSelf.view addSubview:containerView];
    }];
}

-(void)showWaitView {
    [self createWaitView];
}

-(void)hideWaitView {
    for (UIView *containerView in self.view.subviews) {
        if ([containerView isKindOfClass:[UIView class]]) {
            if (containerView.tag == CONTAINERVIEWTAG) {
                [UIView animateWithDuration:0.3 animations:^{
                    [containerView setAlpha:0.1];
                } completion:^(BOOL finished) {
                    [containerView removeFromSuperview];
                }];
            }
        }
    }
}
@end

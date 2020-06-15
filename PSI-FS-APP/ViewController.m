//
//  ViewController.m
//  PSI-FS-APP
//
//  Created by Dave Geoghegan on 3/4/20.
//  Copyright © 2020 Dave Geoghegan. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end


@import Airship;




/// <#Description#>
@implementation ViewController
//@synthesize webView;

- (IBAction)tapExecutives:(id)sender {
    NSLog(@"Hey I am Here!");
    [_LaunchPadView setHidden:YES];
    [_MainWebView setHidden:NO];
  self.navigationController.navigationBarHidden = FALSE;
     NSURL *url = [NSURL URLWithString:@"https://fs.wiki.goto-psi.com/"];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
    [_BrowserView loadRequest:urlReq];
}



- (void)viewDidLoad {
    
    NSLog(@"Hey I am Here!");
    self.navigationController.navigationBarHidden = TRUE;
    
  [super viewDidLoad];
//       webView = [[WKWebView alloc] initWithFrame:[[self view] bounds]];
//    webView.autoresizingMask =  UIViewAutoresizingFlexibleWidth |  UIViewAutoresizingFlexibleHeight;
//    webView.navigationDelegate = self;
//       NSURL *url = [NSURL URLWithString:@"https://fs.wiki.goto-psi.com/fs-launchpad.html"];
////    NSURL *url = [NSURL URLWithString:@"https://fs.wiki.goto-psi.com/mobile-frame-ios-v2.html"];
//
//    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
//
//       [webView loadRequest:urlReq];
////      [self.view addSubview:webView];
    [UAirship push].userPushNotificationsEnabled = YES;

}


/// <#Description#>
/// @param BrowserView <#webView description#>
/// @param navigationAction <#navigationAction description#>
/// @param decisionHandler <#decisionHandler description#>
-(void)BrowserView:(WKWebView *)BrowserView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{

     NSLog(@"Hey I am Here! In Link handler");
     NSString *theURL =  navigationAction.request.URL.absoluteString;
    NSURL *url = navigationAction.request.URL;
    NSLog(@"URL IS  %@",theURL);
    if ([theURL containsString:@"https://"] || [theURL containsString:@"http://"]) {
    if ([theURL containsString:@"fs.wiki.goto-psi.com/"]) {
       decisionHandler(WKNavigationActionPolicyAllow);
    } else {
        UIApplication *application = [UIApplication sharedApplication];
        [application openURL:url options:@{} completionHandler:nil];
        decisionHandler(WKNavigationActionPolicyCancel);
    }
    }
    else {
       decisionHandler(WKNavigationActionPolicyAllow);
    }

}



@end


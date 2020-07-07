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
    [_LaunchPadStackView setHidden:YES];
    [_MainWebView setHidden:NO];
  self.navigationController.navigationBarHidden = FALSE;
     NSURL *url = [NSURL URLWithString:@"https://fs.wiki.goto-psi.com/"];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
    [_BrowserView loadRequest:urlReq];
}
- (IBAction)hideIntro:(id)sender {
    NSLog(@"Hey I am Here Hide Intro!");
    [_LaunchPadStackView setHidden:NO];
    [_IntroStackView setHidden:YES];
}

- (IBAction)GetStartedButton:(id)sender {
     NSLog(@"Hey I am HereGet Started Button!");
  
}
- (IBAction)ButtonClickedLaunchPad:(id)sender {
     NSLog(@"Hey I am Here in Button Clicked LaunchPad!");
     NSLog(@"Sender IS  %@",sender);
}
- (IBAction)executivesButtonClicked:(UIButton *)sender {
    NSLog(@"Hey I am Here in Exec Button Clicked LaunchPad!");
    NSLog(@"Sender IS  %@",sender.titleLabel.text);
   NSString *theURLString = @"";
    if ([sender.titleLabel.text  isEqual: @"Executives"]) {
        theURLString = @"executive";
    }
    else if ([sender.titleLabel.text  isEqual: @"Search"]) {
        theURLString = @"search";
    }
    else if ([sender.titleLabel.text  isEqual: @"Account"]) {
        theURLString = @"user";
    }
    else if ([sender.titleLabel.text  isEqual: @"Trends"]) {
        theURLString = @"trends";
    }
    else if ([sender.titleLabel.text  isEqual: @"Regulation"]) {
        theURLString = @"regulation";
    }
    else if ([sender.titleLabel.text  isEqual: @"Financials"]) {
        theURLString = @"makingmoney";
    }
   else if ([sender.titleLabel.text  isEqual: @"Risks"]) {
       theURLString = @"risk";
   }
    else if ([sender.titleLabel.text  isEqual: @"Products"]) {
        theURLString = @"products";
    }
    [_LaunchPadStackView setHidden:YES];

    NSString *theWholeURL = @"https://fs.wiki.goto-psi.com/";
    theWholeURL = [theWholeURL stringByAppendingString:theURLString];
    
    NSURL *url = [NSURL URLWithString:theWholeURL];
    self.navigationController.navigationBarHidden = FALSE;
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:url];
    [_BrowserView loadRequest:urlReq];
    [_MainWebView setHidden:NO];
}

- (IBAction)BackButtonClicked:(UIBarButtonItem *)sender {
    [_BrowserView goBack];
   
}
- (IBAction)HomeBtnClick:(UIBarButtonItem *)sender {
    [_MainWebView setHidden:YES];
        [_LaunchPadStackView setHidden:NO];
        [_IntroStackView setHidden:YES];
       self.navigationController.navigationBarHidden = TRUE;
}

- (void)viewDidLoad {
    
    NSLog(@"Hey I am Here!");
    self.navigationController.navigationBarHidden = TRUE;
    
  [super viewDidLoad];
    [_MainWebView setHidden:YES];
    [_LaunchPadStackView setHidden:YES];
    [_IntroStackView setHidden:NO];
    _BrowserView.navigationDelegate = self;

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
/// @param webView <#webView description#>
/// @param navigationAction <#navigationAction description#>
/// @param decisionHandler <#decisionHandler description#>

-(void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
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

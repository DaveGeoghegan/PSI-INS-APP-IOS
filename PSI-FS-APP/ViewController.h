//
//  ViewController.h
//  PSI-FS-APP
//
//  Created by Dave Geoghegan on 3/4/20.
//  Copyright © 2020 Dave Geoghegan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface ViewController: UIViewController;



// The main web view that is set up in the viewDidLoad method.
@property (weak, nonatomic) IBOutlet UIView *LaunchPadView;
@property (weak, nonatomic) IBOutlet UIView *MainWebView;
@property (strong, nonatomic) IBOutlet UIView *TopLevelView;
@property (weak, nonatomic) IBOutlet WKWebView *BrowserView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;



@end




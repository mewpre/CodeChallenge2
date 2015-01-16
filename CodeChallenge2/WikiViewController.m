//
//  WikiViewController.m
//  CodeChallenge2
//
//  Created by Yi-Chin Sun on 1/16/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "WikiViewController.h"

@interface WikiViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WikiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self.wikiURL containsString:@" "])
    {
        //Fixes URL in cases where the city has multiple words (e.g. San Francisco)
        self.wikiURL = [self.wikiURL stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    }
    NSURL *url = [NSURL URLWithString:self.wikiURL];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:addressRequest];

}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    self.spinner.hidden = NO;
    [self.spinner startAnimating];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
    self.spinner.hidden = YES;
}

@end

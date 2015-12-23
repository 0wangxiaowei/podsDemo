//
//  TwoViewController.m
//  podsDemo
//
//  Created by apple on 15/12/23.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()<UITextViewDelegate>

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTextView = [[RichTextEditor alloc] initWithFrame:CGRectMake(10, 80, 300, 300)];
    [self.view addSubview:_myTextView];
    UIButton *te = [UIButton buttonWithType:UIButtonTypeContactAdd];

    te.frame = CGRectMake(100, 40, 40, 40);
    te.backgroundColor = [UIColor redColor];
    [te addTarget:self action:@selector(btClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:te];
    
    // Do any additional setup after loading the view.
}
-(void)btClick
{
    UIWebView *webv  = [[UIWebView alloc] initWithFrame:CGRectMake(10, 400, 300, 200)];
    [self.view addSubview:webv];
    webv.backgroundColor= [UIColor redColor];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [webv loadRequest:request];
    
//    [webv lo]
//    [webv loadHTMLString:@"" baseURL:nil];
}
- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor
{
    return RichTextEditorFeatureFontSize | RichTextEditorFeatureFont | RichTextEditorFeatureAll;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    NSLog(@"%@",_myTextView.htmlString);
    if (_myTextView.text.length) {
         NSLog(@"%@",_myTextView.htmlString);
    }
    NSLog(@"%@",_myTextView.text);
    [self.view endEditing:YES];
}
@end

//
//  TwoViewController.m
//  podsDemo
//
//  Created by apple on 15/12/23.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()<UITextViewDelegate>
{
    NSInteger oldLenght;
}
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
    if (!_myTextView.text.length) {
        return;
    }
    UIWebView *webv  = [[UIWebView alloc] initWithFrame:CGRectMake(10, 400, 300, 200)];
    [self.view addSubview:webv];
    webv.backgroundColor= [UIColor redColor];
//    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,   NSUserDomainMask, YES);
    
    NSString *saveDirectory=[paths objectAtIndex:0];
    
    NSString *saveFileName=@"myHTML.html";
    
    NSString *filepath=[saveDirectory stringByAppendingPathComponent:saveFileName];
    
    
     [_myTextView.htmlString  writeToFile:filepath atomically:YES encoding:NSUTF8StringEncoding error:nil];

    NSURL* url = [NSURL fileURLWithPath:filepath];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [webv loadRequest:request];


}
- (RichTextEditorFeature)featuresEnabledForRichTextEditor:(RichTextEditor *)richTextEditor
{
    return RichTextEditorFeatureFontSize | RichTextEditorFeatureFont | RichTextEditorFeatureAll;
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    oldLenght = _myTextView.text.length;
    
    
//    NSLog(@"%@",_myTextView.htmlString);
    if (_myTextView.text.length) {
         NSLog(@"%@",_myTextView.htmlString);
    }
    NSLog(@"%@",_myTextView.text);
    [self.view endEditing:YES];
}
@end

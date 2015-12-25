//
//  ThreeUIViewController.m
//  podsDemo
//
//  Created by apple on 15/12/24.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "ThreeUIViewController.h"
#import "POP.h"
#import "TOWebViewController.h"
@interface ThreeUIViewController ()
{
    UIView *testView;
}
@end

@implementation ThreeUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self spring];
    [self.view addSubview:testView];
    testView.backgroundColor = [UIColor redColor];
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [self.view addGestureRecognizer:tap];
   
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:but];
    but.backgroundColor = [UIColor blueColor];
    
    [but addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    but.frame = CGRectMake(200, 400, 140, 140);
//  [but addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}


//- (void)rotate:(UIPanGestureRecognizer*)recognizer
//{
//    CGPoint velocity = [recognizer velocityInView:self.view];
//    
//    POPSpringAnimation *spring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
//    spring.velocity = [NSValue valueWithCGPoint:velocity];
//    
//    [testView.layer pop_addAnimation:spring forKey:@"rotationAnimation"];
//    
//    
//}

- (void)rotate:(UIPanGestureRecognizer*)recognizer
{
    //拖移速度
    CGPoint velocity = [recognizer velocityInView:self.view];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
//    positionAnimation.dynamicsTension = 5;
//    positionAnimation.dynamicsFriction = 5.0f;
//    positionAnimation.springBounciness = 20.0f;
    [testView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    sizeAnimation.velocity = [NSValue valueWithCGPoint:velocity];
//    sizeAnimation.springBounciness = 1.0f;
    sizeAnimation.dynamicsFriction = 10.0f;
//    [testView.layer pop_addAnimation:sizeAnimation forKey:@"sizeAnimation"];
}
- (void)spring{
   
    POPSpringAnimation* framePOP = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
  
    framePOP.springSpeed = 10.f;
  
    framePOP.springBounciness = 4.f;
 
    framePOP.toValue = [UIColor greenColor];
  
    [framePOP setCompletionBlock:^(POPAnimation * anim , BOOL finsih) {
  
        if (finsih) {
        
//            NSLog(@"view.frame = %@",NSStringFromCGRect(view.frame));
     
        }
  
    }];

    [testView pop_addAnimation:framePOP forKey:@"go"];

}

-(void)btnClick
{
    
    
        TOWebViewController *webViewController = [[TOWebViewController alloc] initWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];


        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:webViewController];
        [self presentViewController:navigationController animated:YES completion:nil];
                                          
                                              
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
//    
//    NSInteger height = CGRectGetHeight(self.view.bounds);
//    NSInteger width = CGRectGetWidth(self.view.bounds);
//    
//    CGFloat centerX = arc4random() % width;
//    CGFloat centerY = arc4random() % height;
//    
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
//    anim.springBounciness = 16;
//    anim.springSpeed = 6;
//    [testView pop_addAnimation:anim forKey:@"center"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

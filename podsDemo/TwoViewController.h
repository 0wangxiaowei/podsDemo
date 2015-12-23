//
//  TwoViewController.h
//  podsDemo
//
//  Created by apple on 15/12/23.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RichTextEditor.h"
@interface TwoViewController : UIViewController<RichTextEditorDataSource>
@property (strong, nonatomic)RichTextEditor *myTextView;

@end

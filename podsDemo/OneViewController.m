
//
//  OneViewController.m
//  podsDemo
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 xiaowei. All rights reserved.
//

#import "OneViewController.h"
#import "FSMediaPicker.h"
@interface OneViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,FSMediaPickerDelegate>

@property (retain, nonatomic)UIImageView *imageView;
@end

@implementation OneViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        _imageView.userInteractionEnabled= YES;
        _imageView.backgroundColor  = [UIColor redColor];
        [self.view addSubview:_imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)] ;
        
        [_imageView addGestureRecognizer:tap];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    // Do any additional setup after loading the view.
}
- (void)click:(UIGestureRecognizer *)sender
{
    FSMediaPicker *mediaPicker = [[FSMediaPicker alloc] init];
//    mediaPicker.mediaType = (FSMediaType)_mediaTypeControl.selectedSegmentIndex;
//    mediaPicker.editMode = (FSEditMode)_editModeControl.selectedSegmentIndex;
    
    mediaPicker.mediaType = 0;
    mediaPicker.editMode = 0;
    mediaPicker.delegate = self;
    [mediaPicker showFromView:sender.view];
}

- (void)mediaPicker:(FSMediaPicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    [self.imageView setImage:mediaInfo.circularEditedImage];
//        [self.imageButton setTitle:nil forState:UIControlStateNormal];
//        if (mediaPicker.editMode == FSEditModeNone) {
////            [self.imageView setImage:mediaInfo.originalImage forState:UIControlStateNormal];
//            [self.imageView setImage:mediaInfo.originalImage];
//        } else {
//            [self.imageButton setImage:mediaPicker.editMode == FSEditModeCircular? mediaInfo.circularEditedImage:mediaInfo.editedImage forState:UIControlStateNormal];
//        }
//    }
}

- (void)mediaPickerDidCancel:(FSMediaPicker *)mediaPicker
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)pickButtonClicked:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Take photo",
                                  @"Select photo from camera", nil];
    actionSheet.cancelButtonIndex = 2;
    [actionSheet showInView:sender];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    };
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
//    imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
    imagePicker.allowsEditing = YES;
    if (buttonIndex == 0 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if (buttonIndex == 1 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.imageView.image = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end

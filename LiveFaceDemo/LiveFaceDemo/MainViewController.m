//
//  MainViewController.m
//  LiveFaceDemo
//
//  Created by onhonehd on 2020/12/28.
//
//  Copyright © 2020年 onhonehd. All rights reserved.


#import "MainViewController.h"
#import <Masonry/Masonry.h>
#import <GPUImage/GPUImage.h>
#import "GPUImageLiveFaceFilter.h"

@interface MainViewController ()

@property (nonatomic, strong) GPUImageView *filterView;
@property (nonatomic, strong) UIButton *liveBtn;
@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionFront];
    self.videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    self.videoCamera.horizontallyMirrorFrontFacingCamera = YES;
    self.filterView = [[GPUImageView alloc] initWithFrame:self.view.frame];
    self.filterView.center = self.view.center;
    
    [self.view addSubview:self.filterView];
    [self.videoCamera addTarget:self.filterView];
    [self.videoCamera startCameraCapture];
    
    _liveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _liveBtn.backgroundColor = [UIColor whiteColor];
    [_liveBtn setTitle:@"开启" forState:UIControlStateNormal];
    [_liveBtn setTitle:@"关闭" forState:UIControlStateSelected];
    [_liveBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_liveBtn addTarget:self action:@selector(liveBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_liveBtn];
    
    [_liveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-20);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
        make.centerX.equalTo(self.view);
    }];
}

- (void)liveBtnAction {
    if (_liveBtn.selected) {
        _liveBtn.selected = NO;
        [self.videoCamera removeAllTargets];
        [self.videoCamera addTarget:self.filterView];
    } else {
        _liveBtn.selected = YES;
        [self.videoCamera removeAllTargets];
        GPUImageFalseColorFilter *beautifyFilter = [[GPUImageFalseColorFilter alloc] init];
        [self.videoCamera addTarget:beautifyFilter];
        [beautifyFilter addTarget:self.filterView];
    }
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

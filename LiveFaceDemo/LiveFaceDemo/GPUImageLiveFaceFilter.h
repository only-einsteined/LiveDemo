//
//  GPUImageLiveFaceFilter.h
//  LiveFaceDemo
//
//  Created by onhonehd on 2020/12/28.
//
//  Copyright © 2020年 onhonehd. All rights reserved.


#import <GPUImage/GPUImage.h>

NS_ASSUME_NONNULL_BEGIN

@class GPUImageCombinationFilter;

@interface GPUImageLiveFaceFilter : GPUImageFilterGroup
{
    GPUImageBilateralFilter *bilateralFilter;
    GPUImageCannyEdgeDetectionFilter *cannyEdgeFilter;
    GPUImageCombinationFilter *combinationFilter;
    GPUImageHSBFilter *hsbFilter;
}
@end

NS_ASSUME_NONNULL_END

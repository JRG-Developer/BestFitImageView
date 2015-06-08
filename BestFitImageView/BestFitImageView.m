//
//  BestFitImageView.m
//  BestFitImageView
//
//  Created by Joshua Greene on 6/7/15.
//  Copyright (c) 2015 JRG-Developer. All rights reserved.
//

#import "BestFitImageView.h"

@implementation BestFitImageView

- (void)setImage:(UIImage *)image {
  
  [super setImage:image];
  [self setBestContentModeForImage:image];
}

- (void)setBestContentModeForImage:(UIImage *)image {
  
  UIViewContentMode contentMode = [self bestContentModeForImage:image];
  self.contentMode = contentMode;
}

- (UIViewContentMode)bestContentModeForImage:(UIImage *)image {

  return [self isImageWidthAndHeightLessThanFrameSize:image] ?
         UIViewContentModeCenter :
         UIViewContentModeScaleAspectFit;
}

- (BOOL)isImageWidthAndHeightLessThanFrameSize:(UIImage *)image {
  
  return image.size.width < CGRectGetWidth(self.frame) &&
         image.size.height < CGRectGetHeight(self.frame);
}

@end

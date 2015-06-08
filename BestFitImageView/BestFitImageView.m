//
//  BestFitImageView.m
//  BestFitImageView
//
//  Created by Joshua Greene on 6/7/15.
//  Copyright (c) 2015 JRG-Developer. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "BestFitImageView.h"

@implementation BestFitImageView

#pragma mark - UIImageView

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

#pragma mark - UIView

- (void)setBounds:(CGRect)bounds {
  
  [super setBounds:bounds];
  [self setBestContentModeForImage:self.image];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (!self) {
    return nil;
  }
  
  [self setBestContentModeForImage:self.image];
  return self;
}

@end

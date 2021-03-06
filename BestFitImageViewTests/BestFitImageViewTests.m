//
//  BestFitImageViewTests.m
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

// Test Class
#import "BestFitImageView.h"

// Collaborators

// Test Support
#import <XCTest/XCTest.h>

#define EXP_SHORTHAND YES
#import <Expecta/Expecta.h>

#import <OCMock/OCMock.h>

@interface BestFitImageView (Private)
- (void)setBestContentModeForImage:(UIImage *)image;
@end

@interface BestFitImageViewTests : XCTestCase
@end

@implementation BestFitImageViewTests {

  BestFitImageView *sut;

  UIViewContentMode defaultScaleContentMode;
  CGRect frame;
  
  id image;
  id partialMock;
}

#pragma mark - Test Lifecycle

- (void)setUp {

  [super setUp];
  
  defaultScaleContentMode = UIViewContentModeScaleAspectFit;
  frame = CGRectMake(0, 0, 200, 400);
  
  sut = [[BestFitImageView alloc] initWithFrame:frame];
}

- (void)tearDown {
  
  [image stopMocking];
  [partialMock stopMocking];
  [super tearDown];
}

#pragma mark - Given - Mocks

- (void)givenMockImageSmallerThanFrame {
  CGSize size = CGSizeMake(frame.size.width - 10.0f, frame.size.height - 10.0f);
  [self givenMockImageWithSize:size];
}

- (void)givenMockImageWithSize:(CGSize)size {
  
  image = OCMClassMock([UIImage class]);
  OCMStub([image size]).andReturn(size);
}

- (void)givenPartialMock {
  partialMock = OCMPartialMock(sut);
}

#pragma mark - Object Lifecycle - Tests

- (void)test___initWithFrame___calls_commonInit {
  
  // given
  sut = [BestFitImageView alloc];

  [self givenPartialMock];
  OCMExpect([partialMock commonInit]);
  
  // when
  sut = [sut initWithFrame:frame];
  
  // then
  OCMVerifyAll(partialMock);
}

- (void)test___initWithImage___calls_commonInit {
  
  // given
  sut = [BestFitImageView alloc];
  
  [self givenPartialMock];
  OCMExpect([partialMock commonInit]);
  
  // when
  sut = [sut initWithImage:nil];
  
  // then
  OCMVerifyAll(partialMock);
}

- (void)test___initWithImage_highlightedImage___calls_commonInit {
  
  // given
  sut = [BestFitImageView alloc];
  
  [self givenPartialMock];
  OCMExpect([partialMock commonInit]);
  
  // when
  sut = [sut initWithImage:nil highlightedImage:nil];
  
  // then
  OCMVerifyAll(partialMock);
}

- (void)test___commonInit___sets_defaultScaleUsingMode {
  
  // given
  [self givenPartialMock];
  OCMExpect([partialMock setScaleUsingMode:defaultScaleContentMode]);
  
  // when
  [sut commonInit];
  
  // then
  OCMVerifyAll(partialMock);
}

#pragma mark - Custom Accessors - Tests

- (void)test___setScaleUsingMode___calls_setBestContentModeForImage {
  
  // given
  [self givenMockImageSmallerThanFrame];
  sut.image = image;
  
  [self givenPartialMock];
  OCMExpect([partialMock setBestContentModeForImage:sut.image]);
  
  // when
  sut.scaleUsingMode = UIViewContentModeRight;
  
  // then
  OCMVerifyAll(partialMock);
}

- (void)test___setBestContentModeForImage___ifImageWidthAndHeightLessThanFrame_setsContentMode_UIViewContentModeCenter {
  
  // given
  [self givenMockImageSmallerThanFrame];
  
  UIViewContentMode expected = UIViewContentModeCenter;
  
  // when
  [sut setBestContentModeForImage:image];
  UIViewContentMode actual = sut.contentMode;
  
  // then
  expect(actual).to.equal(expected);
}

- (void)test___setBestContentModeForImage___ifImageWidthGreaterThanFrameWidth_setsContentMode_scaleUsingMode {
  
  // given
  UIViewContentMode expected = UIViewContentModeScaleToFill;
  sut.scaleUsingMode = expected;
  
  CGSize size = CGSizeMake(frame.size.width + 10.0f, frame.size.height - 10.0f);
  [self givenMockImageWithSize:size];
  
  // when
  [sut setBestContentModeForImage:image];
  UIViewContentMode actual = sut.contentMode;
  
  // then
  expect(actual).to.equal(expected);
}

- (void)test___setBestContentModeForImage___ifImageHeightGreaterThanFrameHeight_setsContentMode_scaleUsingMode {
  
  // given
  UIViewContentMode expected = UIViewContentModeTop;
  sut.scaleUsingMode = expected;
  
  CGSize size = CGSizeMake(frame.size.width - 10.0f, frame.size.height + 10.0f);
  [self givenMockImageWithSize:size];
  
  // when
  [sut setBestContentModeForImage:image];
  UIViewContentMode actual = sut.contentMode;
  
  // then
  expect(actual).to.equal(expected);
}

#pragma mark - NSCoding - Tests

- (void)test___initWithCoder___calls_commonInit {
  
  // given
  sut = [BestFitImageView alloc];
  
  [self givenPartialMock];
  OCMExpect([partialMock commonInit]);
  
  // when
  sut = [sut initWithCoder:nil];
  
  // then
  OCMVerifyAll(partialMock);
}

#pragma mark - UIImageView - Tests

- (void)test___setImage___setsImageOnImageView {
  
  // given
  [self givenMockImageWithSize:frame.size];
  
  // when
  [sut setImage:image];
  
  // then
  expect(sut.image).to.equal(image);
}

- (void)test___setImage___calls_setBestContentModeForImage {
  
  // given
  [self givenMockImageSmallerThanFrame];

  [self givenPartialMock];
  OCMExpect([partialMock setBestContentModeForImage:image]);
  
  // when
  [sut setImage:image];
  
  // then
  OCMVerifyAll(partialMock);
}

#pragma mark - UIView - Tests

- (void)test___setBounds___calls_setBestContentModeForImage {
  
  // given
  [self givenMockImageSmallerThanFrame];
  [sut setImage:image];
  
  [self givenPartialMock];
  OCMExpect([partialMock setBestContentModeForImage:image]);
  
  // when
  [sut setBounds:CGRectZero];
  
  // then
  OCMVerifyAll(partialMock);
}

@end
